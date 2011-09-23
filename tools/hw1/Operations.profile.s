	.file	"Operations.profile.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	subl	$28, %esp
	movl	$4, 12(%esp)
	movl	$EdgeProfCounters, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	calll	llvm_start_edge_profiling
	incl	EdgeProfCounters
	movl	$0, 20(%esp)
	movl	$0, 24(%esp)
	incl	EdgeProfCounters+4
	movl	24(%esp), %eax
	addl	$28, %esp
	ret
.Ltmp0:
	.size	main, .Ltmp0-main

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
.Ltmp1:
	.size	_Z1Av, .Ltmp1-_Z1Av

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters        # @EdgeProfCounters
	.comm	EdgeProfCounters,16,4

	.section	".note.GNU-stack","",@progbits
