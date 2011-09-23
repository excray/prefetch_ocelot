	.file	"Operations.profile.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Leh_func_begin0:
# BB#0:                                 # %entry
	subl	$44, %esp
.Ltmp0:
	movl	$4, 12(%esp)
	movl	$EdgeProfCounters, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	calll	llvm_start_edge_profiling
	incl	EdgeProfCounters
	movl	$.L.str, (%esp)
	calll	puts
	movl	$10, 28(%esp)
	movl	$10, 24(%esp)
	movl	28(%esp), %eax
	addl	$10, %eax
	movl	%eax, 32(%esp)
	addl	24(%esp), %eax
	movl	%eax, 28(%esp)
	addl	32(%esp), %eax
	addl	%eax, 24(%esp)
	calll	_Z1Av
	movl	%eax, 24(%esp)
	movl	$0, 36(%esp)
	movl	$0, 40(%esp)
	incl	EdgeProfCounters+4
	movl	40(%esp), %eax
	addl	$44, %esp
	ret
.Ltmp1:
	.size	main, .Ltmp1-main
.Leh_func_end0:

	.globl	_Z1Av
	.align	16, 0x90
	.type	_Z1Av,@function
_Z1Av:                                  # @_Z1Av
# BB#0:                                 # %entry
	subl	$8, %esp
	incl	EdgeProfCounters+8
	movl	$3, (%esp)
	movl	$3, 4(%esp)
	incl	EdgeProfCounters+12
	movl	4(%esp), %eax
	addl	$8, %esp
	ret
.Ltmp2:
	.size	_Z1Av, .Ltmp2-_Z1Av

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "In Main"
	.size	.L.str, 8

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters        # @EdgeProfCounters
	.comm	EdgeProfCounters,16,4
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
	.byte	48                      # Offset
	.align	4
.Leh_frame_end0:


	.section	".note.GNU-stack","",@progbits
