; ModuleID = 'Operations.profile.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

@EdgeProfCounters = internal global [4 x i32] zeroinitializer

define i32 @main() {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  %newargc = call i32 @llvm_start_edge_profiling(i32 0, i8** null, i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 0), i32 4)
  %OldFuncCounter = load i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 0)
  %NewFuncCounter = add i32 %OldFuncCounter, 1
  store i32 %NewFuncCounter, i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 0)
  %"alloca point" = bitcast i32 0 to i32
  store i32 10, i32* %b, align 4
  store i32 10, i32* %c, align 4
  %1 = load i32* %b, align 4
  %2 = load i32* %c, align 4
  %3 = add nsw i32 %1, %2
  store i32 %3, i32* %a, align 4
  %4 = load i32* %c, align 4
  %5 = load i32* %a, align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, i32* %b, align 4
  %7 = load i32* %a, align 4
  %8 = load i32* %b, align 4
  %9 = add nsw i32 %7, %8
  %10 = load i32* %c, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, i32* %c, align 4
  %12 = call i32 @_Z1Av() nounwind
  store i32 %12, i32* %c, align 4
  store i32 0, i32* %0, align 4
  %13 = load i32* %0, align 4
  store i32 %13, i32* %retval, align 4
  %OldFuncCounter1 = load i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 1)
  %NewFuncCounter2 = add i32 %OldFuncCounter1, 1
  store i32 %NewFuncCounter2, i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 1)
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval
  ret i32 %retval1
}

define i32 @_Z1Av() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %OldFuncCounter = load i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 2)
  %NewFuncCounter = add i32 %OldFuncCounter, 1
  store i32 %NewFuncCounter, i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 2)
  %"alloca point" = bitcast i32 0 to i32
  store i32 3, i32* %0, align 4
  %1 = load i32* %0, align 4
  store i32 %1, i32* %retval, align 4
  %OldFuncCounter1 = load i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 3)
  %NewFuncCounter2 = add i32 %OldFuncCounter1, 1
  store i32 %NewFuncCounter2, i32* getelementptr inbounds ([4 x i32]* @EdgeProfCounters, i32 0, i32 3)
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval
  ret i32 %retval1
}

declare i32 @llvm_start_edge_profiling(i32, i8**, i32*, i32)
