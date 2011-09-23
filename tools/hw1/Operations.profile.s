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
	movl	$17, 12(%esp)
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
	testl	%eax, %eax
	jle	.LBB0_2
# BB#1:                                 # %bb
	incl	EdgeProfCounters+4
	movl	$.L.str1, (%esp)
	calll	printf
	incl	EdgeProfCounters+12
	jmp	.LBB0_5
.LBB0_2:                                # %bb1
	incl	EdgeProfCounters+8
	cmpl	$0, 32(%esp)
	jle	.LBB0_4
# BB#3:                                 # %bb2
	incl	EdgeProfCounters+16
	movl	$.L.str2, (%esp)
	calll	printf
	incl	EdgeProfCounters+24
	jmp	.LBB0_5
.LBB0_4:                                # %bb3
	incl	EdgeProfCounters+20
	movl	$.L.str3, (%esp)
	calll	printf
	incl	EdgeProfCounters+28
.LBB0_5:                                # %bb4
	movl	28(%esp), %eax
	cmpl	$2, %eax
	je	.LBB0_8
# BB#6:                                 # %bb4
	cmpl	$1, %eax
	jne	.LBB0_9
# BB#7:                                 # %bb5
	incl	EdgeProfCounters+36
	movl	$.L.str4, (%esp)
	calll	puts
	incl	EdgeProfCounters+44
	jmp	.LBB0_10
.LBB0_8:                                # %bb6
	incl	EdgeProfCounters+40
	movl	$.L.str5, (%esp)
	calll	puts
	incl	EdgeProfCounters+48
	jmp	.LBB0_10
.LBB0_9:                                # %bb7
	incl	EdgeProfCounters+32
	movl	$.L.str6, (%esp)
	calll	puts
	incl	EdgeProfCounters+52
.LBB0_10:                               # %bb8
	movl	$0, 36(%esp)
	movl	$0, 40(%esp)
	incl	EdgeProfCounters+56
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
	incl	EdgeProfCounters+60
	movl	$3, (%esp)
	movl	$3, 4(%esp)
	incl	EdgeProfCounters+64
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

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "hey"
	.size	.L.str1, 4

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "hoo"
	.size	.L.str2, 4

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "gheer"
	.size	.L.str3, 6

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "case 1"
	.size	.L.str4, 7

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "case 2"
	.size	.L.str5, 7

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "case d"
	.size	.L.str6, 7

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters        # @EdgeProfCounters
	.comm	EdgeProfCounters,68,16
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
