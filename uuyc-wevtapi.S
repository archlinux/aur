# Minimal native wevtapi compatibility layer for Wine.
# Unsupported Windows Event Log queries fail without invoking Wine stubs.

.text
.set ERROR_CALL_NOT_IMPLEMENTED, 120
.set ERROR_NO_MORE_ITEMS, 259

.type set_last_error_and_fail, @function
set_last_error_and_fail:
    subq $40, %rsp
    call SetLastError
    addq $40, %rsp
    xorl %eax, %eax
    ret


.globl DllMain
.type DllMain, @function
DllMain:
    movl $1, %eax
    ret

.globl EvtQuery
.type EvtQuery, @function
EvtQuery:
    movl $ERROR_CALL_NOT_IMPLEMENTED, %ecx
    jmp set_last_error_and_fail

.globl EvtNext
.type EvtNext, @function
EvtNext:
    movq 48(%rsp), %rax
    testq %rax, %rax
    je 1f
    movl $0, (%rax)
1:
    movl $ERROR_NO_MORE_ITEMS, %ecx
    jmp set_last_error_and_fail

.globl EvtRender
.type EvtRender, @function
EvtRender:
    movq 48(%rsp), %rax
    testq %rax, %rax
    je 2f
    movl $0, (%rax)
2:
    movq 56(%rsp), %rax
    testq %rax, %rax
    je 3f
    movl $0, (%rax)
3:
    movl $ERROR_CALL_NOT_IMPLEMENTED, %ecx
    jmp set_last_error_and_fail

.globl EvtOpenPublisherMetadata
.type EvtOpenPublisherMetadata, @function
EvtOpenPublisherMetadata:
    movl $ERROR_CALL_NOT_IMPLEMENTED, %ecx
    jmp set_last_error_and_fail

.globl EvtClose
.type EvtClose, @function
EvtClose:
    movl $1, %eax
    ret

.section .note.GNU-stack,"",@progbits
