.data

.text

j main
factorial:
    addi sp, sp, -8      
    sw ra, 0(sp)            # ra
    sw a0, 4(sp)            #  n
    li t0, 1                
    ble a0, t0, end_fact    # If n <= 1, jump to end_fact

    addi a0, a0, -1         # a0 = n - 1 
    jal factorial           # Recursive call
    lw t1, 4(sp)            # Restore n from stack
    mul a0, a0, t1          # a0 = a0 * n 

end_fact:
    lw ra, 0(sp)            
    addi sp, sp, 8         
    jr ra       

main:
    li a0, 5                
    jal factorial           
  mv a1, a0
    addi a0 x0 1 
    ecall                   # Print result
    li a0, 10               
    ecall