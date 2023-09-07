run_command:
  push ebp
  mov ebp, esp

  push 0
  call get_argument

  call eax

  mov esp, ebp
  pop ebp
  ret
