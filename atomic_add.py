"""Minimal repro for atomic_add with dynamic destination/source slices."""

import os

os.environ.setdefault("TILELANG_ASCEND_MODE", "Developer")
os.environ.setdefault("TILELANG_DISABLE_CACHE", "1")

import torch
import torch_npu  # noqa: F401
import tilelang
import tilelang.language as T

D = 8
DTYPE = "float32"

# Edit these values directly when testing temporary variants.
BASE_VALUES = [10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0]
ACC_VALUES = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
FIXED_SRC_VALUE = 1.0


def make_single_inner_loop_1d_dynamic_dst_fixed_src_kernel():
    @T.prim_func
    def kernel(out: T.Tensor((D,), DTYPE)):
        with T.Kernel(1, is_npu=True) as (_, __):
            acc = T.alloc_shared((1,), DTYPE)
            acc[0] = T.float32(FIXED_SRC_VALUE)

            for d_i in T.serial(D):
                # Dynamic destination slice, fixed source slice.
                T.atomic_add(out[d_i], acc[0])

    return kernel


def make_single_inner_loop_1d_fixed_dst_dynamic_src_kernel():
    @T.prim_func
    def kernel(out: T.Tensor((1,), DTYPE)):
        with T.Kernel(1, is_npu=True) as (_, __):
            acc = T.alloc_shared((D,), DTYPE)
            acc[0] = T.float32(ACC_VALUES[0])
            acc[1] = T.float32(ACC_VALUES[1])
            acc[2] = T.float32(ACC_VALUES[2])
            acc[3] = T.float32(ACC_VALUES[3])
            acc[4] = T.float32(ACC_VALUES[4])
            acc[5] = T.float32(ACC_VALUES[5])
            acc[6] = T.float32(ACC_VALUES[6])
            acc[7] = T.float32(ACC_VALUES[7])

            for d_i in T.serial(D):
                # Fixed destination slice, dynamic source slice.
                T.atomic_add(out[0], acc[d_i])

    return kernel


def main():
    print("atomic_add dynamic source/destination minimal repro")

    # Keep the call site explicit so temporary kernel parameters can be added here directly.
    dynamic_dst_kernel = tilelang.compile(
        make_single_inner_loop_1d_dynamic_dst_fixed_src_kernel(),
        target="npuir",
    )
    dynamic_dst_out = torch.tensor(BASE_VALUES, dtype=torch.float32).npu()
    dynamic_dst_kernel(dynamic_dst_out)
    torch.npu.synchronize()
    dynamic_dst_reference = [value + FIXED_SRC_VALUE for value in BASE_VALUES]

    print("\nCase: dynamic_dst_fixed_src")
    print(f"actual    = {dynamic_dst_out.cpu().reshape(-1).tolist()}")
    print(f"reference = {dynamic_dst_reference}")

    # Keep the call site explicit so temporary kernel parameters can be added here directly.
    fixed_dst_kernel = tilelang.compile(
        make_single_inner_loop_1d_fixed_dst_dynamic_src_kernel(),
        target="npuir",
    )
    fixed_dst_out = torch.tensor([BASE_VALUES[0]], dtype=torch.float32).npu()
    fixed_dst_kernel(fixed_dst_out)
    torch.npu.synchronize()
    fixed_dst_reference = [BASE_VALUES[0] + sum(ACC_VALUES)]

    print("\nCase: fixed_dst_dynamic_src")
    print(f"actual    = {fixed_dst_out.cpu().reshape(-1).tolist()}")
    print(f"reference = {fixed_dst_reference}")


if __name__ == "__main__":
    main()
