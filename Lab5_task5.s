.data

.text

j main
fibo:
# 0, 1, 1, 2, 3, 5, 8
    addi sp, sp, -4      
    sw ra, 0(sp)            # ra

    
    li t0, 1                
    ble a0, t0, end_fibo    # If n <= 1, jump to end_fibo
    
    addi sp, sp, -4
    sw a0, 0(sp)
    
    addi a0, a0, -1         # a0 = n - 1 
    jal fibo           # Recursive call
    mv a1 a0           # a1 = fib(n-1)

    # get data from stack 
    lw a0, 0(sp)
    sw a1, 0(sp)
    addi a0, a0, -2
    jal fibo
    lw a1, 0(sp)
    add a0, a1, a0  
    lw ra, 4(sp)            # ra
    addi sp, sp, 8  
    ret
end_fibo:
    lw ra, 0(sp)            
    addi sp, sp, 4        
    jr ra # ret       

main:
    li a0, 6    
    jal fibo  # jal ra, fibo (stores the address of next instruction in ra)         
    mv a1, a0
    addi a0 x0 1 
    ecall                   # Print result
    
    li a0, 10               
    ecall