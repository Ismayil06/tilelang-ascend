module attributes {hivm.module_core_type = #hivm.module_core_type<MIX>, memref.memref_as_ptr} {
  func.func @mamba_mimo_fwd_kernel(%arg0: i64 {hacc.arg_type = #hacc.arg_type<ffts_base_address>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg2: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg3: memref<?xbf16>, %arg4: memref<?xbf16>, %arg5: memref<?xbf16>, %arg6: memref<?xf32>, %arg7: memref<?xf32>, %arg8: memref<?xf32>, %arg9: memref<?xf32>, %arg10: memref<?xf32>, %arg11: memref<?xbf16>, %arg12: memref<?xf32>, %arg13: memref<?xf32>, %arg14: memref<?xf32>, %arg15: memref<?xf32>, %arg16: memref<?xf32>, %arg17: memref<?xf32>, %arg18: memref<?xbf16>, %arg19: memref<?xf32>, %arg20: memref<?xbf16>, %arg21: memref<?xf32>, %arg22: memref<?xbf16>, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.part_of_mix, mix_mode = "mix"} {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.98412701E-4 : f32
    %cst_0 = arith.constant 0.00833333377 : f32
    %cst_1 = arith.constant -0.166666672 : f32
    %cst_2 = arith.constant -0.00138888892 : f32
    %cst_3 = arith.constant 0.0416666679 : f32
    %c32 = arith.constant 32 : index
    %c262144 = arith.constant 262144 : index
    %c16384 = arith.constant 16384 : index
    %c8 = arith.constant 8 : index
    %c32784 = arith.constant 32784 : index
    %c2049 = arith.constant 2049 : index
    %c32768 = arith.constant 32768 : index
    %c2048 = arith.constant 2048 : index
    %c4 = arith.constant 4 : index
    %c256 = arith.constant 256 : index
    %c2097152 = arith.constant 2097152 : index
    %c1024 = arith.constant 1024 : index
    %c131072 = arith.constant 131072 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %false = arith.constant false
    %c7_i32 = arith.constant 7 : i32
    %cst_4 = arith.constant 2.000000e+00 : f32
    %cst_5 = arith.constant 5.000000e-01 : f32
    %cst_6 = arith.constant -5.000000e-01 : f32
    %true = arith.constant true
    %c2047_i32 = arith.constant 2047 : i32
    %cst_7 = arith.constant 1.000000e+00 : f32
    %cst_8 = arith.constant 0.000000e+00 : f32
    %cst_9 = arith.constant -1.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c256_i32 = arith.constant 256 : i32
    %c8_i32 = arith.constant 8 : i32
    %c4_i32 = arith.constant 4 : i32
    %c1_i32 = arith.constant 1 : i32
    hivm.hir.set_ffts_base_addr %arg0
    %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [0], sizes: [4, 2048, 4, 1, 16], strides: [%c131072, %c64, %c16, %c16, %c1] : memref<?xbf16> to memref<4x2048x4x1x16xbf16, strided<[131072, 64, 16, 16, 1]>>
    %reinterpret_cast_10 = memref.reinterpret_cast %arg5 to offset: [0], sizes: [4, 2048, 16, 64], strides: [%c2097152, %c1024, %c64, %c1] : memref<?xbf16> to memref<4x2048x16x64xbf16, strided<[2097152, 1024, 64, 1]>>
    %reinterpret_cast_11 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [16, 4, 64], strides: [%c256, %c64, %c1] : memref<?xf32> to memref<16x4x64xf32, strided<[256, 64, 1]>>
    %reinterpret_cast_12 = memref.reinterpret_cast %arg7 to offset: [0], sizes: [16, 4, 16], strides: [%c64, %c16, %c1] : memref<?xf32> to memref<16x4x16xf32, strided<[64, 16, 1]>>
    %reinterpret_cast_13 = memref.reinterpret_cast %arg14 to offset: [0], sizes: [4, 2048, 16, 4], strides: [%c131072, %c64, %c4, %c1] : memref<?xf32> to memref<4x2048x16x4xf32, strided<[131072, 64, 4, 1]>>
    %reinterpret_cast_14 = memref.reinterpret_cast %arg15 to offset: [0], sizes: [4, 16, 2048], strides: [%c32768, %c2048, %c1] : memref<?xf32> to memref<4x16x2048xf32, strided<[32768, 2048, 1]>>
    %reinterpret_cast_15 = memref.reinterpret_cast %arg11 to offset: [0], sizes: [4, 2048, 16, 64], strides: [%c2097152, %c1024, %c64, %c1] : memref<?xbf16> to memref<4x2048x16x64xbf16, strided<[2097152, 1024, 64, 1]>>
    %reinterpret_cast_16 = memref.reinterpret_cast %arg8 to offset: [0], sizes: [16, 4, 16], strides: [%c64, %c16, %c1] : memref<?xf32> to memref<16x4x16xf32, strided<[64, 16, 1]>>
    %reinterpret_cast_17 = memref.reinterpret_cast %arg18 to offset: [0], sizes: [4, 16, 2049], strides: [%c32784, %c2049, %c1] : memref<?xbf16> to memref<4x16x2049xbf16, strided<[32784, 2049, 1]>>
    %reinterpret_cast_18 = memref.reinterpret_cast %arg4 to offset: [0], sizes: [4, 2048, 4, 1, 16], strides: [%c131072, %c64, %c16, %c16, %c1] : memref<?xbf16> to memref<4x2048x4x1x16xbf16, strided<[131072, 64, 16, 16, 1]>>
    %reinterpret_cast_19 = memref.reinterpret_cast %arg6 to offset: [0], sizes: [4, 2048, 16, 64], strides: [%c2097152, %c1024, %c64, %c1] : memref<?xf32> to memref<4x2048x16x64xf32, strided<[2097152, 1024, 64, 1]>>
    %reinterpret_cast_20 = memref.reinterpret_cast %arg12 to offset: [0], sizes: [16], strides: [%c1] : memref<?xf32> to memref<16xf32, strided<[1]>>
    %reinterpret_cast_21 = memref.reinterpret_cast %arg16 to offset: [0], sizes: [4, 16, 2048], strides: [%c32768, %c2048, %c1] : memref<?xf32> to memref<4x16x2048xf32, strided<[32768, 2048, 1]>>
    %reinterpret_cast_22 = memref.reinterpret_cast %arg17 to offset: [0], sizes: [4, 16, 2049], strides: [%c32784, %c2049, %c1] : memref<?xf32> to memref<4x16x2049xf32, strided<[32784, 2049, 1]>>
    %reinterpret_cast_23 = memref.reinterpret_cast %arg19 to offset: [0], sizes: [4, 16, 256, 8, 8], strides: [%c262144, %c16384, %c64, %c8, %c1] : memref<?xf32> to memref<4x16x256x8x8xf32, strided<[262144, 16384, 64, 8, 1]>>
    %reinterpret_cast_24 = memref.reinterpret_cast %arg10 to offset: [0], sizes: [16, 4, 64], strides: [%c256, %c64, %c1] : memref<?xf32> to memref<16x4x64xf32, strided<[256, 64, 1]>>
    %reinterpret_cast_25 = memref.reinterpret_cast %arg13 to offset: [0], sizes: [16, 4, 64], strides: [%c256, %c64, %c1] : memref<?xf32> to memref<16x4x64xf32, strided<[256, 64, 1]>>
    %0 = hivm.hir.get_block_idx -> i64
    %1 = arith.trunci %0 : i64 to i32
    scf.for %arg29 = %c0_i32 to %c4_i32 step %c1_i32  : i32 {
      %2 = tensor.empty() : tensor<1x4x16xf32>
      %3 = tensor.empty() : tensor<1x4x16xf32>
      %4 = tensor.empty() : tensor<16x64xf32>
      %5 = tensor.empty() : tensor<1x4x64xf32>
      %6 = tensor.empty() : tensor<1x4x64xf32>
      %7 = hivm.hir.vbrc ins(%cst_8 : f32) outs(%4 : tensor<16x64xf32>) -> tensor<16x64xf32>
      %8 = arith.index_cast %1 : i32 to index
      %subview = memref.subview %reinterpret_cast_24[%8, 0, 0] [1, 4, 64] [1, 1, 1] : memref<16x4x64xf32, strided<[256, 64, 1]>> to memref<4x64xf32, strided<[64, 1], offset: ?>>
      %alloc = memref.alloc() : memref<4x64xf32>
      memref.copy %subview, %alloc : memref<4x64xf32, strided<[64, 1], offset: ?>> to memref<4x64xf32>
      %9 = bufferization.to_tensor %alloc restrict : memref<4x64xf32>
      %inserted_slice = tensor.insert_slice %9 into %5[0, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<4x64xf32> into tensor<1x4x64xf32>
      %subview_26 = memref.subview %reinterpret_cast_11[%8, 0, 0] [1, 4, 64] [1, 1, 1] : memref<16x4x64xf32, strided<[256, 64, 1]>> to memref<4x64xf32, strided<[64, 1], offset: ?>>
      %alloc_27 = memref.alloc() : memref<4x64xf32>
      memref.copy %subview_26, %alloc_27 : memref<4x64xf32, strided<[64, 1], offset: ?>> to memref<4x64xf32>
      %10 = bufferization.to_tensor %alloc_27 restrict : memref<4x64xf32>
      %inserted_slice_28 = tensor.insert_slice %10 into %6[0, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<4x64xf32> into tensor<1x4x64xf32>
      %subview_29 = memref.subview %reinterpret_cast_12[%8, 0, 0] [1, 4, 16] [1, 1, 1] : memref<16x4x16xf32, strided<[64, 16, 1]>> to memref<4x16xf32, strided<[16, 1], offset: ?>>
      %alloc_30 = memref.alloc() : memref<4x16xf32>
      memref.copy %subview_29, %alloc_30 : memref<4x16xf32, strided<[16, 1], offset: ?>> to memref<4x16xf32>
      %11 = bufferization.to_tensor %alloc_30 restrict : memref<4x16xf32>
      %inserted_slice_31 = tensor.insert_slice %11 into %2[0, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<4x16xf32> into tensor<1x4x16xf32>
      %subview_32 = memref.subview %reinterpret_cast_16[%8, 0, 0] [1, 4, 16] [1, 1, 1] : memref<16x4x16xf32, strided<[64, 16, 1]>> to memref<4x16xf32, strided<[16, 1], offset: ?>>
      %alloc_33 = memref.alloc() : memref<4x16xf32>
      memref.copy %subview_32, %alloc_33 : memref<4x16xf32, strided<[16, 1], offset: ?>> to memref<4x16xf32>
      %12 = bufferization.to_tensor %alloc_33 restrict : memref<4x16xf32>
      %inserted_slice_34 = tensor.insert_slice %12 into %3[0, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<4x16xf32> into tensor<1x4x16xf32>
      %13 = scf.for %arg30 = %c0_i32 to %c256_i32 step %c1_i32 iter_args(%arg31 = %7) -> (tensor<16x64xf32>)  : i32 {
        %14 = tensor.empty() : tensor<8x1x64xbf16>
        %15 = tensor.empty() : tensor<8xf32>
        %16 = tensor.empty() : tensor<8xf32>
        %17 = tensor.empty() : tensor<8xf32>
        %18 = tensor.empty() : tensor<8x4x64xbf16>
        %19 = tensor.empty() : tensor<32x32xf32>
        %20 = tensor.empty() : tensor<8x4x4xf32>
        %21 = tensor.empty() : tensor<8x4x4xf32>
        %22 = tensor.empty() : tensor<1x8x4xf32>
        %23 = tensor.empty() : tensor<1x8x4xf32>
        %24 = tensor.empty() : tensor<1x8x4xf32>
        %25 = tensor.empty() : tensor<1x4x4xf32>
        %collapsed = tensor.collapse_shape %25 [[0, 1], [2]] : tensor<1x4x4xf32> into tensor<4x4xf32>
        %26 = tensor.empty() : tensor<32x64xf32>
        %27 = tensor.empty() : tensor<8x4x4xf32>
        %28 = tensor.empty() : tensor<8x4x4xf32>
        %29 = tensor.empty() : tensor<32x32xf32>
        %30 = tensor.empty() : tensor<32x32xf32>
        %31 = tensor.empty() : tensor<32x64xf32>
        %32 = tensor.empty() : tensor<8x4x64xf32>
        %33 = tensor.empty() : tensor<8x4x64xf32>
        %34 = tensor.empty() : tensor<8x4x64xf32>
        %35 = tensor.empty() : tensor<8x4x64xf32>
        %36 = tensor.empty() : tensor<8x4x64xf32>
        %37 = tensor.empty() : tensor<1x4x64xf32>
        %38 = tensor.empty() : tensor<8x4x64xf32>
        %39 = tensor.empty() : tensor<8x4x64xf32>
        %40 = tensor.empty() : tensor<8x1x64xf32>
        %41 = tensor.empty() : tensor<1x1xf32>
        %42 = tensor.empty() : tensor<32x16xf32>
        %43 = tensor.empty() : tensor<8x1x64xf32>
        %44 = tensor.empty() : tensor<8x4x64xf32>
        %45 = arith.index_cast %arg29 : i32 to index
        %46 = arith.index_cast %1 : i32 to index
        %47 = arith.index_cast %arg30 : i32 to index
        %subview_35 = memref.subview %reinterpret_cast_23[%45, %46, %47, 0, 0] [1, 1, 1, 8, 8] [1, 1, 1, 1, 1] : memref<4x16x256x8x8xf32, strided<[262144, 16384, 64, 8, 1]>> to memref<8x8xf32, strided<[8, 1], offset: ?>>
        %alloc_36 = memref.alloc() : memref<8x8xf32>
        memref.copy %subview_35, %alloc_36 : memref<8x8xf32, strided<[8, 1], offset: ?>> to memref<8x8xf32>
        %48 = bufferization.to_tensor %alloc_36 restrict : memref<8x8xf32>
        %49 = arith.muli %arg30, %c8_i32 : i32
        %50 = arith.addi %49, %c1_i32 : i32
        %51 = arith.index_cast %50 : i32 to index
        %subview_37 = memref.subview %reinterpret_cast_17[%45, %46, %51] [1, 1, 8] [1, 1, 1] : memref<4x16x2049xbf16, strided<[32784, 2049, 1]>> to memref<8xbf16, strided<[1], offset: ?>>
        %alloc_38 = memref.alloc() : memref<8xbf16>
        memref.copy %subview_37, %alloc_38 : memref<8xbf16, strided<[1], offset: ?>> to memref<8xbf16>
        %52 = bufferization.to_tensor %alloc_38 restrict : memref<8xbf16>
        %53 = tensor.empty() : tensor<8xf32>
        %54 = hivm.hir.vcast ins(%52 : tensor<8xbf16>) outs(%53 : tensor<8xf32>) -> tensor<8xf32>
        %55 = hivm.hir.vmul ins(%54, %cst_9 : tensor<8xf32>, f32) outs(%54 : tensor<8xf32>) -> tensor<8xf32>
        %56 = hivm.hir.vsub ins(%cst_8, %55 : f32, tensor<8xf32>) outs(%55 : tensor<8xf32>) -> tensor<8xf32>
        %57 = hivm.hir.vexp ins(%56 : tensor<8xf32>) outs(%55 : tensor<8xf32>) -> tensor<8xf32>
        %58 = hivm.hir.vadd ins(%57, %cst_7 : tensor<8xf32>, f32) outs(%55 : tensor<8xf32>) -> tensor<8xf32>
        %59 = hivm.hir.vdiv ins(%cst_7, %58 : f32, tensor<8xf32>) outs(%55 : tensor<8xf32>) -> tensor<8xf32>
        %subview_39 = memref.subview %reinterpret_cast_22[%45, %46, %51] [1, 1, 8] [1, 1, 1] : memref<4x16x2049xf32, strided<[32784, 2049, 1]>> to memref<8xf32, strided<[1], offset: ?>>
        %alloc_40 = memref.alloc() : memref<8xf32>
        memref.copy %subview_39, %alloc_40 : memref<8xf32, strided<[1], offset: ?>> to memref<8xf32>
        %60 = bufferization.to_tensor %alloc_40 restrict : memref<8xf32>
        %61 = hivm.hir.vbrc ins(%cst_8 : f32) outs(%15 : tensor<8xf32>) -> tensor<8xf32>
        %62 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %61) -> (tensor<8xf32>)  : i32 {
          %176 = arith.muli %arg30, %c8_i32 : i32
          %177 = arith.addi %176, %arg32 : i32
          %178 = arith.cmpi slt, %177, %c2047_i32 : i32
          %179 = scf.if %178 -> (tensor<8xf32>) {
            %180 = arith.index_cast %arg32 : i32 to index
            %extracted_73 = tensor.extract %60[%180] : tensor<8xf32>
            %extracted_74 = tensor.extract %59[%180] : tensor<8xf32>
            %181 = arith.mulf %extracted_73, %extracted_74 : f32
            %inserted = tensor.insert %181 into %arg33[%180] : tensor<8xf32>
            scf.yield %inserted : tensor<8xf32>
          } else {
            scf.yield %arg33 : tensor<8xf32>
          }
          scf.yield %179 : tensor<8xf32>
        }
        %63 = arith.index_cast %49 : i32 to index
        %subview_41 = memref.subview %reinterpret_cast_17[%45, %46, %63] [1, 1, 8] [1, 1, 1] : memref<4x16x2049xbf16, strided<[32784, 2049, 1]>> to memref<8xbf16, strided<[1], offset: ?>>
        %alloc_42 = memref.alloc() : memref<8xbf16>
        memref.copy %subview_41, %alloc_42 : memref<8xbf16, strided<[1], offset: ?>> to memref<8xbf16>
        %64 = bufferization.to_tensor %alloc_42 restrict : memref<8xbf16>
        %65 = tensor.empty() : tensor<8xf32>
        %66 = hivm.hir.vcast ins(%64 : tensor<8xbf16>) outs(%65 : tensor<8xf32>) -> tensor<8xf32>
        %67 = hivm.hir.vsub ins(%cst_8, %66 : f32, tensor<8xf32>) outs(%66 : tensor<8xf32>) -> tensor<8xf32>
        %68 = hivm.hir.vexp ins(%67 : tensor<8xf32>) outs(%66 : tensor<8xf32>) -> tensor<8xf32>
        %69 = hivm.hir.vadd ins(%68, %cst_7 : tensor<8xf32>, f32) outs(%66 : tensor<8xf32>) -> tensor<8xf32>
        %70 = hivm.hir.vdiv ins(%cst_7, %69 : f32, tensor<8xf32>) outs(%66 : tensor<8xf32>) -> tensor<8xf32>
        %subview_43 = memref.subview %reinterpret_cast_22[%45, %46, %63] [1, 1, 8] [1, 1, 1] : memref<4x16x2049xf32, strided<[32784, 2049, 1]>> to memref<8xf32, strided<[1], offset: ?>>
        %alloc_44 = memref.alloc() : memref<8xf32>
        memref.copy %subview_43, %alloc_44 : memref<8xf32, strided<[1], offset: ?>> to memref<8xf32>
        %71 = bufferization.to_tensor %alloc_44 restrict : memref<8xf32>
        %72 = hivm.hir.vmul ins(%71, %70 : tensor<8xf32>, tensor<8xf32>) outs(%16 : tensor<8xf32>) -> tensor<8xf32>
        %73 = hivm.hir.vadd ins(%72, %62 : tensor<8xf32>, tensor<8xf32>) outs(%17 : tensor<8xf32>) -> tensor<8xf32>
        %subview_45 = memref.subview %reinterpret_cast_10[%45, %63, %46, 0] [1, 8, 1, 64] [1, 1, 1, 1] : memref<4x2048x16x64xbf16, strided<[2097152, 1024, 64, 1]>> to memref<8x64xbf16, strided<[1024, 1], offset: ?>>
        %alloc_46 = memref.alloc() : memref<8x64xbf16>
        memref.copy %subview_45, %alloc_46 : memref<8x64xbf16, strided<[1024, 1], offset: ?>> to memref<8x64xbf16>
        %74 = bufferization.to_tensor %alloc_46 restrict : memref<8x64xbf16>
        %inserted_slice_47 = tensor.insert_slice %74 into %14[0, 0, 0] [8, 1, 64] [1, 1, 1] : tensor<8x64xbf16> into tensor<8x1x64xbf16>
        %75 = hivm.hir.vcast ins(%inserted_slice_47 : tensor<8x1x64xbf16>) outs(%43 : tensor<8x1x64xf32>) -> tensor<8x1x64xf32>
        %76 = hivm.hir.vmul ins(%75, %inserted_slice_28 : tensor<8x1x64xf32>, tensor<1x4x64xf32>) outs(%44 : tensor<8x4x64xf32>) broadcast = [0, 1] -> tensor<8x4x64xf32>
        %77 = hivm.hir.vcast ins(%76 : tensor<8x4x64xf32>) outs(%18 : tensor<8x4x64xbf16>) -> tensor<8x4x64xbf16>
        %collapsed_48 = tensor.collapse_shape %77 [[0, 1], [2]] : tensor<8x4x64xbf16> into tensor<32x64xbf16>
        %subview_49 = memref.subview %reinterpret_cast[%45, %63, 0, 0, 0] [1, 8, 4, 1, 16] [1, 1, 1, 1, 1] : memref<4x2048x4x1x16xbf16, strided<[131072, 64, 16, 16, 1]>> to memref<8x4x16xbf16, strided<[64, 16, 1], offset: ?>>
        %alloc_50 = memref.alloc() : memref<8x4x16xbf16>
        memref.copy %subview_49, %alloc_50 : memref<8x4x16xbf16, strided<[64, 16, 1], offset: ?>> to memref<8x4x16xbf16>
        %78 = bufferization.to_tensor %alloc_50 restrict : memref<8x4x16xbf16>
        %79 = tensor.empty() : tensor<8x4x16xf32>
        %80 = hivm.hir.vcast ins(%78 : tensor<8x4x16xbf16>) outs(%79 : tensor<8x4x16xf32>) -> tensor<8x4x16xf32>
        %81 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %80) -> (tensor<8x4x16xf32>)  : i32 {
          %176 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %arg33[%176, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<8x4x16xf32> to tensor<1x4x16xf32>
          %177 = tensor.empty() : tensor<1x4x16xf32>
          %178 = hivm.hir.vadd ins(%extracted_slice, %inserted_slice_31 : tensor<1x4x16xf32>, tensor<1x4x16xf32>) outs(%177 : tensor<1x4x16xf32>) -> tensor<1x4x16xf32>
          %inserted_slice_73 = tensor.insert_slice %178 into %arg33[%176, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<1x4x16xf32> into tensor<8x4x16xf32>
          scf.yield %inserted_slice_73 : tensor<8x4x16xf32>
        }
        %collapsed_51 = tensor.collapse_shape %81 [[0, 1], [2]] : tensor<8x4x16xf32> into tensor<32x16xf32>
        %subview_52 = memref.subview %reinterpret_cast_18[%45, %63, 0, 0, 0] [1, 8, 4, 1, 16] [1, 1, 1, 1, 1] : memref<4x2048x4x1x16xbf16, strided<[131072, 64, 16, 16, 1]>> to memref<8x4x16xbf16, strided<[64, 16, 1], offset: ?>>
        %alloc_53 = memref.alloc() : memref<8x4x16xbf16>
        memref.copy %subview_52, %alloc_53 : memref<8x4x16xbf16, strided<[64, 16, 1], offset: ?>> to memref<8x4x16xbf16>
        %82 = bufferization.to_tensor %alloc_53 restrict : memref<8x4x16xbf16>
        %83 = tensor.empty() : tensor<8x4x16xf32>
        %84 = hivm.hir.vcast ins(%82 : tensor<8x4x16xbf16>) outs(%83 : tensor<8x4x16xf32>) -> tensor<8x4x16xf32>
        %85 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %84) -> (tensor<8x4x16xf32>)  : i32 {
          %176 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %arg33[%176, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<8x4x16xf32> to tensor<1x4x16xf32>
          %177 = tensor.empty() : tensor<1x4x16xf32>
          %178 = hivm.hir.vadd ins(%extracted_slice, %inserted_slice_34 : tensor<1x4x16xf32>, tensor<1x4x16xf32>) outs(%177 : tensor<1x4x16xf32>) -> tensor<1x4x16xf32>
          %inserted_slice_73 = tensor.insert_slice %178 into %arg33[%176, 0, 0] [1, 4, 16] [1, 1, 1] : tensor<1x4x16xf32> into tensor<8x4x16xf32>
          scf.yield %inserted_slice_73 : tensor<8x4x16xf32>
        }
        %collapsed_54 = tensor.collapse_shape %85 [[0, 1], [2]] : tensor<8x4x16xf32> into tensor<32x16xf32>
        %86 = hivm.hir.mmadL1 {b_transpose} ins(%collapsed_51, %collapsed_54, %true, %c32, %c32, %c16 : tensor<32x16xf32>, tensor<32x16xf32>, i1, index, index, index) outs(%19 : tensor<32x32xf32>) -> tensor<32x32xf32>
        %87:2 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %20, %arg34 = %21) -> (tensor<8x4x4xf32>, tensor<8x4x4xf32>)  : i32 {
          %176 = arith.muli %arg32, %c4_i32 : i32
          %177 = arith.index_cast %176 : i32 to index
          %178 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %collapsed_51[%177, 0] [4, 4] [1, 1] : tensor<32x16xf32> to tensor<4x4xf32>
          %inserted_slice_73 = tensor.insert_slice %extracted_slice into %arg33[%178, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<4x4xf32> into tensor<8x4x4xf32>
          %extracted_slice_74 = tensor.extract_slice %collapsed_51[%177, 8] [4, 4] [1, 1] : tensor<32x16xf32> to tensor<4x4xf32>
          %inserted_slice_75 = tensor.insert_slice %extracted_slice_74 into %arg34[%178, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<4x4xf32> into tensor<8x4x4xf32>
          scf.yield %inserted_slice_73, %inserted_slice_75 : tensor<8x4x4xf32>, tensor<8x4x4xf32>
        }
        %subview_55 = memref.subview %reinterpret_cast_13[%45, %63, %46, 0] [1, 8, 1, 4] [1, 1, 1, 1] : memref<4x2048x16x4xf32, strided<[131072, 64, 4, 1]>> to memref<8x4xf32, strided<[64, 1], offset: ?>>
        %alloc_56 = memref.alloc() : memref<8x4xf32>
        memref.copy %subview_55, %alloc_56 : memref<8x4xf32, strided<[64, 1], offset: ?>> to memref<8x4xf32>
        %88 = bufferization.to_tensor %alloc_56 restrict : memref<8x4xf32>
        %inserted_slice_57 = tensor.insert_slice %88 into %22[0, 0, 0] [1, 8, 4] [1, 1, 1] : tensor<8x4xf32> into tensor<1x8x4xf32>
        %89 = tensor.empty() : tensor<1x8x4xf32>
        %90 = tensor.empty() : tensor<1x8x4xf32>
        %91 = tensor.empty() : tensor<1x8x4xf32>
        %92 = tensor.empty() : tensor<1x8x4xf32>
        %93 = hivm.hir.vmul ins(%inserted_slice_57, %inserted_slice_57 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%89 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %94 = hivm.hir.vmul ins(%93, %93 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%90 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %95 = hivm.hir.vmul ins(%93, %94 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%91 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %96 = hivm.hir.vmul ins(%93, %cst_6 : tensor<1x8x4xf32>, f32) outs(%93 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %97 = hivm.hir.vmul ins(%94, %cst_3 : tensor<1x8x4xf32>, f32) outs(%94 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %98 = hivm.hir.vmul ins(%95, %cst_2 : tensor<1x8x4xf32>, f32) outs(%95 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %99 = hivm.hir.vadd ins(%96, %cst_7 : tensor<1x8x4xf32>, f32) outs(%92 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %100 = hivm.hir.vadd ins(%97, %99 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%99 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %101 = hivm.hir.vadd ins(%98, %100 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%23 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %102 = tensor.empty() : tensor<1x8x4xf32>
        %103 = tensor.empty() : tensor<1x8x4xf32>
        %104 = tensor.empty() : tensor<1x8x4xf32>
        %105 = tensor.empty() : tensor<1x8x4xf32>
        %106 = tensor.empty() : tensor<1x8x4xf32>
        %107 = hivm.hir.vmul ins(%inserted_slice_57, %inserted_slice_57 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%102 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %108 = hivm.hir.vmul ins(%107, %inserted_slice_57 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%103 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %109 = hivm.hir.vmul ins(%108, %107 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%104 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %110 = hivm.hir.vmul ins(%109, %107 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%105 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %111 = hivm.hir.vmul ins(%108, %cst_1 : tensor<1x8x4xf32>, f32) outs(%108 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %112 = hivm.hir.vmul ins(%109, %cst_0 : tensor<1x8x4xf32>, f32) outs(%109 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %113 = hivm.hir.vmul ins(%110, %cst : tensor<1x8x4xf32>, f32) outs(%110 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %114 = hivm.hir.vadd ins(%inserted_slice_57, %111 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%106 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %115 = hivm.hir.vadd ins(%112, %114 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%114 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %116 = hivm.hir.vadd ins(%113, %115 : tensor<1x8x4xf32>, tensor<1x8x4xf32>) outs(%24 : tensor<1x8x4xf32>) -> tensor<1x8x4xf32>
        %117:2 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %collapsed_51, %arg34 = %25) -> (tensor<32x16xf32>, tensor<1x4x4xf32>)  : i32 {
          %176 = tensor.empty() : tensor<1x4x4xf32>
          %177 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %101[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_73 = tensor.extract_slice %87#0[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %178 = hivm.hir.vmul ins(%extracted_slice, %extracted_slice_73 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%176 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %179 = arith.muli %arg32, %c4_i32 : i32
          %180 = arith.index_cast %179 : i32 to index
          %extracted_slice_74 = tensor.extract_slice %178[0, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<1x4x4xf32> to tensor<4x4xf32>
          %extracted_slice_75 = tensor.extract_slice %116[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_76 = tensor.extract_slice %87#1[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %181 = hivm.hir.vmul ins(%extracted_slice_75, %extracted_slice_76 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%arg34 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %182 = tensor.empty() : tensor<4x4xf32>
          %183 = hivm.hir.vsub ins(%extracted_slice_74, %collapsed : tensor<4x4xf32>, tensor<4x4xf32>) outs(%182 : tensor<4x4xf32>) -> tensor<4x4xf32>
          %inserted_slice_77 = tensor.insert_slice %183 into %arg33[%180, 0] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<32x16xf32>
          %extracted_slice_78 = tensor.extract_slice %116[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_79 = tensor.extract_slice %87#0[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %184 = hivm.hir.vmul ins(%extracted_slice_78, %extracted_slice_79 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%178 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %extracted_slice_80 = tensor.extract_slice %184[0, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<1x4x4xf32> to tensor<4x4xf32>
          %extracted_slice_81 = tensor.extract_slice %101[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_82 = tensor.extract_slice %87#1[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %185 = hivm.hir.vmul ins(%extracted_slice_81, %extracted_slice_82 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%181 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %186 = tensor.empty() : tensor<4x4xf32>
          %187 = hivm.hir.vadd ins(%extracted_slice_80, %collapsed : tensor<4x4xf32>, tensor<4x4xf32>) outs(%186 : tensor<4x4xf32>) -> tensor<4x4xf32>
          %inserted_slice_83 = tensor.insert_slice %187 into %inserted_slice_77[%180, 8] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<32x16xf32>
          scf.yield %inserted_slice_83, %185 : tensor<32x16xf32>, tensor<1x4x4xf32>
        }
        %118 = tensor.empty() : tensor<16x64xbf16>
        %119 = hivm.hir.vcast ins(%arg31 : tensor<16x64xf32>) outs(%118 : tensor<16x64xbf16>) -> tensor<16x64xbf16>
        %120 = hivm.hir.mmadL1 ins(%117#0, %119, %true, %c32, %c16, %c64 : tensor<32x16xf32>, tensor<16x64xbf16>, i1, index, index, index) outs(%26 : tensor<32x64xf32>) -> tensor<32x64xf32>
        %121:2 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %27, %arg34 = %28) -> (tensor<8x4x4xf32>, tensor<8x4x4xf32>)  : i32 {
          %176 = arith.muli %arg32, %c4_i32 : i32
          %177 = arith.index_cast %176 : i32 to index
          %178 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %collapsed_54[%177, 0] [4, 4] [1, 1] : tensor<32x16xf32> to tensor<4x4xf32>
          %inserted_slice_73 = tensor.insert_slice %extracted_slice into %arg33[%178, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<4x4xf32> into tensor<8x4x4xf32>
          %extracted_slice_74 = tensor.extract_slice %collapsed_54[%177, 8] [4, 4] [1, 1] : tensor<32x16xf32> to tensor<4x4xf32>
          %inserted_slice_75 = tensor.insert_slice %extracted_slice_74 into %arg34[%178, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<4x4xf32> into tensor<8x4x4xf32>
          scf.yield %inserted_slice_73, %inserted_slice_75 : tensor<8x4x4xf32>, tensor<8x4x4xf32>
        }
        %122:2 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %collapsed_54, %arg34 = %117#1) -> (tensor<32x16xf32>, tensor<1x4x4xf32>)  : i32 {
          %176 = tensor.empty() : tensor<1x4x4xf32>
          %177 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %101[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_73 = tensor.extract_slice %121#0[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %178 = hivm.hir.vmul ins(%extracted_slice, %extracted_slice_73 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%176 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %179 = arith.muli %arg32, %c4_i32 : i32
          %180 = arith.index_cast %179 : i32 to index
          %extracted_slice_74 = tensor.extract_slice %178[0, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<1x4x4xf32> to tensor<4x4xf32>
          %extracted_slice_75 = tensor.extract_slice %116[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_76 = tensor.extract_slice %121#1[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %181 = hivm.hir.vmul ins(%extracted_slice_75, %extracted_slice_76 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%arg34 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %182 = tensor.empty() : tensor<4x4xf32>
          %183 = hivm.hir.vsub ins(%extracted_slice_74, %collapsed : tensor<4x4xf32>, tensor<4x4xf32>) outs(%182 : tensor<4x4xf32>) -> tensor<4x4xf32>
          %inserted_slice_77 = tensor.insert_slice %183 into %arg33[%180, 0] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<32x16xf32>
          %extracted_slice_78 = tensor.extract_slice %116[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_79 = tensor.extract_slice %121#0[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %184 = hivm.hir.vmul ins(%extracted_slice_78, %extracted_slice_79 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%178 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %extracted_slice_80 = tensor.extract_slice %184[0, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<1x4x4xf32> to tensor<4x4xf32>
          %extracted_slice_81 = tensor.extract_slice %101[0, %177, 0] [1, 1, 4] [1, 1, 1] : tensor<1x8x4xf32> to tensor<1x1x4xf32>
          %extracted_slice_82 = tensor.extract_slice %121#1[%177, 0, 0] [1, 4, 4] [1, 1, 1] : tensor<8x4x4xf32> to tensor<1x4x4xf32>
          %185 = hivm.hir.vmul ins(%extracted_slice_81, %extracted_slice_82 : tensor<1x1x4xf32>, tensor<1x4x4xf32>) outs(%181 : tensor<1x4x4xf32>) broadcast = [1] -> tensor<1x4x4xf32>
          %186 = tensor.empty() : tensor<4x4xf32>
          %187 = hivm.hir.vadd ins(%extracted_slice_80, %collapsed : tensor<4x4xf32>, tensor<4x4xf32>) outs(%186 : tensor<4x4xf32>) -> tensor<4x4xf32>
          %inserted_slice_83 = tensor.insert_slice %187 into %inserted_slice_77[%180, 8] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<32x16xf32>
          scf.yield %inserted_slice_83, %185 : tensor<32x16xf32>, tensor<1x4x4xf32>
        }
        %123 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %122#0) -> (tensor<32x16xf32>)  : i32 {
          %176 = arith.muli %arg32, %c4_i32 : i32
          %177 = arith.index_cast %176 : i32 to index
          %extracted_slice = tensor.extract_slice %arg33[%177, 0] [4, 16] [1, 1] : tensor<32x16xf32> to tensor<4x16xf32>
          %178 = arith.index_cast %arg32 : i32 to index
          %extracted_73 = tensor.extract %73[%178] : tensor<8xf32>
          %179 = tensor.empty() : tensor<4x16xf32>
          %180 = hivm.hir.vmul ins(%extracted_slice, %extracted_73 : tensor<4x16xf32>, f32) outs(%179 : tensor<4x16xf32>) -> tensor<4x16xf32>
          %inserted_slice_74 = tensor.insert_slice %180 into %arg33[%177, 0] [4, 16] [1, 1] : tensor<4x16xf32> into tensor<32x16xf32>
          scf.yield %inserted_slice_74 : tensor<32x16xf32>
        }
        %124 = hivm.hir.mmadL1 {b_transpose} ins(%117#0, %123, %true, %c32, %c32, %c16 : tensor<32x16xf32>, tensor<32x16xf32>, i1, index, index, index) outs(%29 : tensor<32x32xf32>) -> tensor<32x32xf32>
        %subview_58 = memref.subview %reinterpret_cast_14[%45, %46, %63] [1, 1, 8] [1, 1, 1] : memref<4x16x2048xf32, strided<[32768, 2048, 1]>> to memref<8xf32, strided<[1], offset: ?>>
        %alloc_59 = memref.alloc() : memref<8xf32>
        memref.copy %subview_58, %alloc_59 : memref<8xf32, strided<[1], offset: ?>> to memref<8xf32>
        %125 = bufferization.to_tensor %alloc_59 restrict : memref<8xf32>
        %126 = hivm.hir.vbrc ins(%cst_8 : f32) outs(%30 : tensor<32x32xf32>) -> tensor<32x32xf32>
        %127 = hivm.hir.vexp ins(%48 : tensor<8x8xf32>) outs(%48 : tensor<8x8xf32>) -> tensor<8x8xf32>
        %128 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %126) -> (tensor<32x32xf32>)  : i32 {
          %176 = scf.for %arg34 = %c0_i32 to %arg32 step %c1_i32 iter_args(%arg35 = %arg33) -> (tensor<32x32xf32>)  : i32 {
            %177 = arith.muli %arg32, %c4_i32 : i32
            %178 = arith.index_cast %177 : i32 to index
            %179 = arith.muli %arg34, %c4_i32 : i32
            %180 = arith.index_cast %179 : i32 to index
            %extracted_slice = tensor.extract_slice %124[%178, %180] [4, 4] [1, 1] : tensor<32x32xf32> to tensor<4x4xf32>
            %181 = arith.index_cast %arg32 : i32 to index
            %182 = arith.index_cast %arg34 : i32 to index
            %extracted_73 = tensor.extract %127[%181, %182] : tensor<8x8xf32>
            %183 = tensor.empty() : tensor<4x4xf32>
            %184 = hivm.hir.vmul ins(%extracted_slice, %extracted_73 : tensor<4x4xf32>, f32) outs(%183 : tensor<4x4xf32>) -> tensor<4x4xf32>
            %inserted_slice_74 = tensor.insert_slice %184 into %arg35[%178, %180] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<32x32xf32>
            scf.yield %inserted_slice_74 : tensor<32x32xf32>
          }
          scf.yield %176 : tensor<32x32xf32>
        }
        %129 = hivm.hir.vexp ins(%125 : tensor<8xf32>) outs(%125 : tensor<8xf32>) -> tensor<8xf32>
        %130 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %120) -> (tensor<32x64xf32>)  : i32 {
          %176 = arith.muli %arg32, %c4_i32 : i32
          %177 = arith.index_cast %176 : i32 to index
          %extracted_slice = tensor.extract_slice %arg33[%177, 0] [4, 64] [1, 1] : tensor<32x64xf32> to tensor<4x64xf32>
          %178 = arith.index_cast %arg32 : i32 to index
          %extracted_73 = tensor.extract %129[%178] : tensor<8xf32>
          %179 = tensor.empty() : tensor<4x64xf32>
          %180 = hivm.hir.vmul ins(%extracted_slice, %extracted_73 : tensor<4x64xf32>, f32) outs(%179 : tensor<4x64xf32>) -> tensor<4x64xf32>
          %inserted_slice_74 = tensor.insert_slice %180 into %arg33[%177, 0] [4, 64] [1, 1] : tensor<4x64xf32> into tensor<32x64xf32>
          scf.yield %inserted_slice_74 : tensor<32x64xf32>
        }
        %131 = tensor.empty() : tensor<32x32xbf16>
        %132 = hivm.hir.vcast ins(%128 : tensor<32x32xf32>) outs(%131 : tensor<32x32xbf16>) -> tensor<32x32xbf16>
        %133 = hivm.hir.mmadL1 ins(%132, %collapsed_48, %true, %c32, %c32, %c64 : tensor<32x32xbf16>, tensor<32x64xbf16>, i1, index, index, index) outs(%31 : tensor<32x64xf32>) -> tensor<32x64xf32>
        %134 = hivm.hir.vadd ins(%130, %133 : tensor<32x64xf32>, tensor<32x64xf32>) outs(%130 : tensor<32x64xf32>) -> tensor<32x64xf32>
        %135 = hivm.hir.vbrc ins(%cst_8 : f32) outs(%32 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %136 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %135) -> (tensor<8x4x64xf32>)  : i32 {
          %176 = tensor.empty() : tensor<4x64xf32>
          %177 = arith.muli %arg32, %c4_i32 : i32
          %178 = arith.index_cast %177 : i32 to index
          %extracted_slice = tensor.extract_slice %86[%178, %178] [4, 4] [1, 1] : tensor<32x32xf32> to tensor<4x4xf32>
          %179 = tensor.empty() : tensor<4x4xbf16>
          %180 = hivm.hir.vcast ins(%extracted_slice : tensor<4x4xf32>) outs(%179 : tensor<4x4xbf16>) -> tensor<4x4xbf16>
          %extracted_slice_73 = tensor.extract_slice %collapsed_48[%178, 0] [4, 64] [1, 1] : tensor<32x64xbf16> to tensor<4x64xbf16>
          %181 = hivm.hir.mmadL1 ins(%180, %extracted_slice_73, %true, %c4, %c4, %c64 : tensor<4x4xbf16>, tensor<4x64xbf16>, i1, index, index, index) outs(%176 : tensor<4x64xf32>) -> tensor<4x64xf32>
          %182 = arith.index_cast %arg32 : i32 to index
          %inserted_slice_74 = tensor.insert_slice %181 into %arg33[%182, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<4x64xf32> into tensor<8x4x64xf32>
          %extracted_slice_75 = tensor.extract_slice %inserted_slice_74[%182, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<8x4x64xf32> to tensor<1x4x64xf32>
          %extracted_76 = tensor.extract %72[%182] : tensor<8xf32>
          %183 = tensor.empty() : tensor<1x4x64xf32>
          %184 = hivm.hir.vmul ins(%extracted_slice_75, %extracted_76 : tensor<1x4x64xf32>, f32) outs(%183 : tensor<1x4x64xf32>) -> tensor<1x4x64xf32>
          %inserted_slice_77 = tensor.insert_slice %184 into %inserted_slice_74[%182, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<1x4x64xf32> into tensor<8x4x64xf32>
          scf.yield %inserted_slice_77 : tensor<8x4x64xf32>
        }
        %137 = memref.load %reinterpret_cast_20[%46] : memref<16xf32, strided<[1]>>
        %138 = scf.for %arg32 = %c0_i32 to %c8_i32 step %c1_i32 iter_args(%arg33 = %33) -> (tensor<8x4x64xf32>)  : i32 {
          %176 = arith.muli %arg32, %c4_i32 : i32
          %177 = arith.index_cast %176 : i32 to index
          %178 = arith.index_cast %arg32 : i32 to index
          %extracted_slice = tensor.extract_slice %collapsed_48[%177, 0] [4, 64] [1, 1] : tensor<32x64xbf16> to tensor<4x64xbf16>
          %179 = tensor.empty() : tensor<8x4x64xbf16>
          %inserted_slice_73 = tensor.insert_slice %extracted_slice into %179[%178, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<4x64xbf16> into tensor<8x4x64xbf16>
          %180 = tensor.empty() : tensor<8x4x64xf32>
          %181 = hivm.hir.vcast ins(%inserted_slice_73 : tensor<8x4x64xbf16>) outs(%180 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
          scf.yield %181 : tensor<8x4x64xf32>
        }
        %139 = hivm.hir.vmul ins(%138, %137 : tensor<8x4x64xf32>, f32) outs(%138 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %140 = hivm.hir.vadd ins(%136, %139 : tensor<8x4x64xf32>, tensor<8x4x64xf32>) outs(%136 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %collapsed_60 = tensor.collapse_shape %140 [[0, 1], [2]] : tensor<8x4x64xf32> into tensor<32x64xf32>
        %141 = hivm.hir.vadd ins(%collapsed_60, %134 : tensor<32x64xf32>, tensor<32x64xf32>) outs(%134 : tensor<32x64xf32>) -> tensor<32x64xf32>
        %expanded = tensor.expand_shape %141 [[0, 1], [2]] output_shape [8, 4, 64] : tensor<32x64xf32> into tensor<8x4x64xf32>
        %subview_61 = memref.subview %reinterpret_cast_15[%45, %63, %46, 0] [1, 8, 1, 64] [1, 1, 1, 1] : memref<4x2048x16x64xbf16, strided<[2097152, 1024, 64, 1]>> to memref<8x64xbf16, strided<[1024, 1], offset: ?>>
        %alloc_62 = memref.alloc() : memref<8x64xbf16>
        memref.copy %subview_61, %alloc_62 : memref<8x64xbf16, strided<[1024, 1], offset: ?>> to memref<8x64xbf16>
        %142 = bufferization.to_tensor %alloc_62 restrict : memref<8x64xbf16>
        %143 = tensor.empty() : tensor<8x1x64xbf16>
        %inserted_slice_63 = tensor.insert_slice %142 into %143[0, 0, 0] [8, 1, 64] [1, 1, 1] : tensor<8x64xbf16> into tensor<8x1x64xbf16>
        %144 = tensor.empty() : tensor<8x1x64xf32>
        %145 = hivm.hir.vcast ins(%inserted_slice_63 : tensor<8x1x64xbf16>) outs(%144 : tensor<8x1x64xf32>) -> tensor<8x1x64xf32>
        %subview_64 = memref.subview %reinterpret_cast_25[%46, 0, 0] [1, 4, 64] [1, 1, 1] : memref<16x4x64xf32, strided<[256, 64, 1]>> to memref<4x64xf32, strided<[64, 1], offset: ?>>
        %alloc_65 = memref.alloc() : memref<4x64xf32>
        memref.copy %subview_64, %alloc_65 : memref<4x64xf32, strided<[64, 1], offset: ?>> to memref<4x64xf32>
        %146 = bufferization.to_tensor %alloc_65 restrict : memref<4x64xf32>
        %inserted_slice_66 = tensor.insert_slice %146 into %37[0, 0, 0] [1, 4, 64] [1, 1, 1] : tensor<4x64xf32> into tensor<1x4x64xf32>
        %147 = hivm.hir.vmul ins(%inserted_slice_66, %cst_5 : tensor<1x4x64xf32>, f32) outs(%inserted_slice_66 : tensor<1x4x64xf32>) -> tensor<1x4x64xf32>
        %148 = hivm.hir.vmul ins(%145, %147 : tensor<8x1x64xf32>, tensor<1x4x64xf32>) outs(%35 : tensor<8x4x64xf32>) broadcast = [0, 1] -> tensor<8x4x64xf32>
        %149 = tensor.empty() : tensor<8x4x64xf32>
        %150 = tensor.empty() : tensor<8x4x64xf32>
        %151 = tensor.empty() : tensor<8x4x64xf32>
        %152 = tensor.empty() : tensor<8x4x64xf32>
        %153 = hivm.hir.vmul ins(%148, %cst_4 : tensor<8x4x64xf32>, f32) outs(%149 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %154 = hivm.hir.vexp ins(%153 : tensor<8x4x64xf32>) outs(%150 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %155 = hivm.hir.vsub ins(%154, %cst_7 : tensor<8x4x64xf32>, f32) outs(%151 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %156 = hivm.hir.vadd ins(%154, %cst_7 : tensor<8x4x64xf32>, f32) outs(%152 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %157 = hivm.hir.vdiv ins(%155, %156 : tensor<8x4x64xf32>, tensor<8x4x64xf32>) outs(%36 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %158 = hivm.hir.vmul ins(%148, %157 : tensor<8x4x64xf32>, tensor<8x4x64xf32>) outs(%38 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %159 = hivm.hir.vadd ins(%148, %158 : tensor<8x4x64xf32>, tensor<8x4x64xf32>) outs(%34 : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %160 = hivm.hir.vmul ins(%inserted_slice, %159 : tensor<1x4x64xf32>, tensor<8x4x64xf32>) outs(%39 : tensor<8x4x64xf32>) broadcast = [0] -> tensor<8x4x64xf32>
        %161 = hivm.hir.vmul ins(%160, %expanded : tensor<8x4x64xf32>, tensor<8x4x64xf32>) outs(%expanded : tensor<8x4x64xf32>) -> tensor<8x4x64xf32>
        %162 = tensor.empty() : tensor<8x4x64xbf16>
        %163 = hivm.hir.vcast ins(%161 : tensor<8x4x64xf32>) outs(%162 : tensor<8x4x64xbf16>) -> tensor<8x4x64xbf16>
        %164 = hivm.hir.vbrc ins(%cst_8 : f32) outs(%40 : tensor<8x1x64xf32>) -> tensor<8x1x64xf32>
        %165 = scf.for %arg32 = %c0_i32 to %c4_i32 step %c1_i32 iter_args(%arg33 = %164) -> (tensor<8x1x64xf32>)  : i32 {
          %176 = tensor.empty() : tensor<8x1x64xf32>
          %extracted_slice = tensor.extract_slice %163[0, 0, 0] [8, 1, 64] [1, 1, 1] : tensor<8x4x64xbf16> to tensor<8x1x64xbf16>
          %177 = hivm.hir.vcast ins(%extracted_slice : tensor<8x1x64xbf16>) outs(%176 : tensor<8x1x64xf32>) -> tensor<8x1x64xf32>
          %178 = hivm.hir.vadd ins(%177, %arg33 : tensor<8x1x64xf32>, tensor<8x1x64xf32>) outs(%arg33 : tensor<8x1x64xf32>) -> tensor<8x1x64xf32>
          scf.yield %178 : tensor<8x1x64xf32>
        }
        %subview_67 = memref.subview %reinterpret_cast_19[%45, %63, %46, 0] [1, 8, 1, 64] [1, 1, 1, 1] : memref<4x2048x16x64xf32, strided<[2097152, 1024, 64, 1]>> to memref<8x1x64xf32, strided<[1024, 64, 1], offset: ?>>
        bufferization.materialize_in_destination %165 in writable %subview_67 : (tensor<8x1x64xf32>, memref<8x1x64xf32, strided<[1024, 64, 1], offset: ?>>) -> ()
        %subview_68 = memref.subview %reinterpret_cast_21[%45, %46, %63] [1, 1, 8] [1, 1, 1] : memref<4x16x2048xf32, strided<[32768, 2048, 1]>> to memref<8xf32, strided<[1], offset: ?>>
        %alloc_69 = memref.alloc() : memref<8xf32>
        memref.copy %subview_68, %alloc_69 : memref<8xf32, strided<[1], offset: ?>> to memref<8xf32>
        %166 = tensor.empty() : tensor<32x16xbf16>
        %167 = hivm.hir.vcast ins(%123 : tensor<32x16xf32>) outs(%166 : tensor<32x16xbf16>) -> tensor<32x16xbf16>
        %168 = arith.addi %49, %c7_i32 : i32
        %169 = arith.index_cast %168 : i32 to index
        %subview_70 = memref.subview %reinterpret_cast_14[%45, %46, %169] [1, 1, 1] [1, 1, 1] : memref<4x16x2048xf32, strided<[32768, 2048, 1]>> to memref<1xf32, strided<[32768], offset: ?>>
        %alloc_71 = memref.alloc() : memref<1xf32>
        memref.copy %subview_70, %alloc_71 : memref<1xf32, strided<[32768], offset: ?>> to memref<1xf32>
        %170 = bufferization.to_tensor %alloc_71 restrict : memref<1xf32>
        %inserted_slice_72 = tensor.insert_slice %170 into %41[0, 0] [1, 1] [1, 1] : tensor<1xf32> into tensor<1x1xf32>
        %171 = hivm.hir.vexp ins(%inserted_slice_72 : tensor<1x1xf32>) outs(%inserted_slice_72 : tensor<1x1xf32>) -> tensor<1x1xf32>
        %extracted = tensor.extract %171[%c0, %c0] : tensor<1x1xf32>
        %172 = hivm.hir.vmul ins(%arg31, %extracted : tensor<16x64xf32>, f32) outs(%arg31 : tensor<16x64xf32>) -> tensor<16x64xf32>
        %173 = hivm.hir.vcast ins(%167 : tensor<32x16xbf16>) outs(%42 : tensor<32x16xf32>) -> tensor<32x16xf32>
        %174 = hivm.hir.vcast ins(%173 : tensor<32x16xf32>) outs(%167 : tensor<32x16xbf16>) -> tensor<32x16xbf16>
        %175 = hivm.hir.mmadL1 {a_transpose} ins(%174, %collapsed_48, %false, %c32, %c32, %c64 : tensor<32x16xbf16>, tensor<32x64xbf16>, i1, index, index, index) outs(%172 : tensor<16x64xf32>) -> tensor<16x64xf32>
        scf.yield %175 : tensor<16x64xf32>
      }
    }
    return
  }
}