; ModuleID = 'OperationsInst.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
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
  store i32 %9, i32* %c, align 4
  store i32 0, i32* %0, align 4
  %10 = load i32* %0, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval
  ret i32 %retval1
}
