.data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9   # array of 9 elements

.text

j main
sumArray:
    addi sp sp -4         
    sw   ra 0(sp)          
    mv t0, a0        
    li   t1 0 #i
    li   t2 0 #sum
    li   t3 9            

loop:
    bge  t1 t3, done   
    slli t4 t1 2
    add t4 t4 t0
    lw   t5 0(t4) #array
    add  t2 t2 t5 #sum+=
    addi t1 t1 1 # i++
    j    loop             

done:
    mv   a0 t2 # return sum in a0
    lw   ra 0(sp)         
    addi sp sp 4         
    ret          

main:
    la   a0 array 
    jal ra sumArray 
    mv a1, t2
    li   a0 1
    ecall                