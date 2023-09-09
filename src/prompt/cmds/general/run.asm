run_command:
  push ebp
  mov ebp, esp

  push 1
  call get_argument

  push eax
  call hex_to_num_value

  call eax

  mov esp, ebp
  pop ebp
  ret
