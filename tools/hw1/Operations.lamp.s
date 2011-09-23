	.file	"<stdin>"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Leh_func_begin0:
# BB#0:                                 # %entry
	pushl	%ebp
.Ltmp0:
	pushl	%ebx
.Ltmp1:
	pushl	%edi
.Ltmp2:
	pushl	%esi
.Ltmp3:
	subl	$44, %esp
.Ltmp4:
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$21, (%esp)
	calll	LAMP_init
	leal	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	$0, 16(%esp)
	movl	$10, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, (%esp)
	calll	LAMP_store4
	movl	$10, 28(%esp)
	leal	24(%esp), %esi
	movl	%esi, 4(%esp)
	movl	$0, 16(%esp)
	movl	$10, 12(%esp)
	movl	$0, 8(%esp)
	movl	$1, (%esp)
	calll	LAMP_store4
	movl	$10, 24(%esp)
	leal	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	$0, 8(%esp)
	movl	$2, (%esp)
	calll	LAMP_load4
	movl	28(%esp), %edi
	movl	%esi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$3, (%esp)
	calll	LAMP_load4
	movl	24(%esp), %ebx
	addl	%edi, %ebx
	movl	%ebx, 12(%esp)
	leal	32(%esp), %edi
	movl	%edi, 4(%esp)
	movl	%ebx, %edx
	sarl	$31, %edx
	movl	%edx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$4, (%esp)
	calll	LAMP_store4
	movl	%ebx, 32(%esp)
	movl	%esi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$5, (%esp)
	calll	LAMP_load4
	movl	24(%esp), %ebx
	movl	%edi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$6, (%esp)
	calll	LAMP_load4
	movl	32(%esp), %ebp
	addl	%ebx, %ebp
	movl	%ebp, 12(%esp)
	leal	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%ebp, %edx
	sarl	$31, %edx
	movl	%edx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$7, (%esp)
	calll	LAMP_store4
	movl	%ebp, 28(%esp)
	movl	%edi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$8, (%esp)
	calll	LAMP_load4
	movl	32(%esp), %edi
	leal	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	$0, 8(%esp)
	movl	$9, (%esp)
	calll	LAMP_load4
	movl	28(%esp), %ebx
	movl	%esi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$10, (%esp)
	addl	%edi, %ebx
	calll	LAMP_load4
	movl	24(%esp), %edi
	addl	%ebx, %edi
	movl	%edi, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, %ecx
	sarl	$31, %ecx
	movl	%ecx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$11, (%esp)
	calll	LAMP_store4
	movl	%edi, 24(%esp)
	calll	_Z1Av
	movl	%eax, %edi
	movl	%edi, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, %ecx
	sarl	$31, %ecx
	movl	%ecx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$12, (%esp)
	calll	LAMP_store4
	movl	%edi, 24(%esp)
	leal	36(%esp), %esi
	movl	%esi, 4(%esp)
	movl	$0, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$13, (%esp)
	calll	LAMP_store4
	movl	$0, 36(%esp)
	movl	%esi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$14, (%esp)
	calll	LAMP_load4
	movl	36(%esp), %esi
	movl	%esi, 12(%esp)
	leal	40(%esp), %edi
	movl	%edi, 4(%esp)
	movl	%esi, %ecx
	sarl	$31, %ecx
	movl	%ecx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$15, (%esp)
	calll	LAMP_store4
	movl	%esi, 40(%esp)
	movl	%edi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$16, (%esp)
	calll	LAMP_load4
	movl	40(%esp), %eax
	addl	$44, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
.Leh_func_end0:

	.globl	_Z1Av
	.align	16, 0x90
	.type	_Z1Av,@function
_Z1Av:                                  # @_Z1Av
# BB#0:                                 # %entry
	pushl	%edi
	pushl	%esi
	subl	$36, %esp
	leal	28(%esp), %esi
	movl	%esi, 4(%esp)
	movl	$0, 16(%esp)
	movl	$3, 12(%esp)
	movl	$0, 8(%esp)
	movl	$17, (%esp)
	calll	LAMP_store4
	movl	$3, 28(%esp)
	movl	%esi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$18, (%esp)
	calll	LAMP_load4
	movl	28(%esp), %esi
	movl	%esi, 12(%esp)
	leal	32(%esp), %edi
	movl	%edi, 4(%esp)
	movl	%esi, %ecx
	sarl	$31, %ecx
	movl	%ecx, 16(%esp)
	movl	$0, 8(%esp)
	movl	$19, (%esp)
	calll	LAMP_store4
	movl	%esi, 32(%esp)
	movl	%edi, 4(%esp)
	movl	$0, 8(%esp)
	movl	$20, (%esp)
	calll	LAMP_load4
	movl	32(%esp), %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	ret
.Ltmp6:
	.size	_Z1Av, .Ltmp6-_Z1Av

	.section	.eh_frame,"a",@progbits
.LEH_frame0:
.Lsection_eh_frame0:
.Leh_frame_common0:
.Lset0 = .Leh_frame_common_end0-.Leh_frame_common_begin0 # Length of Common Information Entry
	.long	.Lset0
.Leh_frame_common_begin0:
	.long	0                       # CIE Identifier Tag
	.byte	1                       # DW_CIE_VERSION
	.byte	0                       # CIE Augmentation
	.byte	1                       # CIE Code Alignment Factor
	.byte	124                     # CIE Data Alignment Factor
	.byte	8                       # CIE Return Address Column
	.byte	12                      # DW_CFA_def_cfa
	.byte	4                       # Register
	.byte	4                       # Offset
	.byte	136                     # DW_CFA_offset + Reg (8)
	.byte	1                       # Offset
	.align	4
.Leh_frame_common_end0:
.Lmain.eh:
.Lset1 = .Leh_frame_end0-.Leh_frame_begin0 # Length of Frame Information Entry
	.long	.Lset1
.Leh_frame_begin0:
.Lset2 = .Leh_frame_begin0-.Leh_frame_common0 # FDE CIE offset
	.long	.Lset2
	.long	.Leh_func_begin0        # FDE initial location
.Lset3 = .Leh_func_end0-.Leh_func_begin0 # FDE address range
	.long	.Lset3
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
.Lset4 = .Ltmp0-.Leh_func_begin0
	.long	.Lset4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset
	.byte	4                       # DW_CFA_advance_loc4
.Lset5 = .Ltmp1-.Ltmp0
	.long	.Lset5
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	12                      # Offset
	.byte	4                       # DW_CFA_advance_loc4
.Lset6 = .Ltmp2-.Ltmp1
	.long	.Lset6
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset
	.byte	4                       # DW_CFA_advance_loc4
.Lset7 = .Ltmp3-.Ltmp2
	.long	.Lset7
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	20                      # Offset
	.byte	4                       # DW_CFA_advance_loc4
.Lset8 = .Ltmp4-.Ltmp3
	.long	.Lset8
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	64                      # Offset
	.byte	134                     # DW_CFA_offset + Reg (6)
	.byte	5                       # Offset
	.byte	135                     # DW_CFA_offset + Reg (7)
	.byte	4                       # Offset
	.byte	131                     # DW_CFA_offset + Reg (3)
	.byte	3                       # Offset
	.byte	133                     # DW_CFA_offset + Reg (5)
	.byte	2                       # Offset
	.align	4
.Leh_frame_end0:


	.section	".note.GNU-stack","",@progbits
