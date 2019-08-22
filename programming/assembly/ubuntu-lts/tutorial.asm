; nasm -f elf64 tutorial.asm
; ld -s -o tutorial tutorial.o

section .text
global _start   ;must be declared for linker (ld)

_syscall:
  int 0x80      ;system call

_start:         ;tell linker entry point
  mov edx,len   ;message length
  mov ecx,msg   ;message to write
  mov ebx,1     ;file descriptor (stdout)
  mov eax,4     ;system call number (sys_write)

  call _syscall ;call kernel

  mov eax,1     ;system call number (sys_exit)

  call _syscall ;call kernel

section .data
msg db "hello world, engineer",0xa ;our dear string
len equ $ - msg                    ;length of our dear string
