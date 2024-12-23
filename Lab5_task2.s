.data

.text

j main

factorial:
  #  addi sp, sp, -8         
 #   sw ra, 0(sp)            
 #   sw a0, 4(sp)           
    li t0, 1                #  result = 1
    li t1, 1                #  i = 1 (loop counter)

fact_loop:
    bgt t1, a0, end_fact    # If i > n, exit loop
    mul t0, t0, t1          # result *= i
    addi t1, t1, 1          # i++
    j fact_loop             # Repeat loop

end_fact:
    mv a0, t0               # Move result to a0 
 #   lw ra, 0(sp)            
 #   lw a0, 4(sp)        
 #   addi sp, sp, 8       
    jr ra              

main:
    li a0, 5                #  (n = 5)
    jal factorial           
    mv a1, a0
    addi a0 x0 1 
    ecall                   # Print result
    li a0, 10               
    ecall