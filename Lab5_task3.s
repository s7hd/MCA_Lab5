.data
array: .word 4,1,3,5,2,6
size: .word 6

.text
main:
    la a0, array
    lw a1, size
    jal ra, bubbleSort
    
    li a0, 1
    la t0, array
    lw a1, 0(t0)
    ecall
    lw a1, 4(t0)
    ecall
    lw a1, 8(t0)
    ecall
    lw a1, 12(t0)
    ecall
    lw a1, 16(t0)
    ecall
    lw a1, 20(t0)
    ecall
    
    li a0, 10 # exit call
    ecall
    
bubbleSort:
    addi t0, x0, 0 #i = 0
outer_loop:
    sub t2, a1, t0  #Check if i<n-1
    addi t2, t2, -1
    blez t2, done
    addi t1, x0, 0 # j = 0
inner_loop:
    sub t3, a1, t0 # Check if j<n-i-1
    addi t3, t3, -1
    sub t3, t3, t1
    blez t3, outer_next
    slli t4, t1, 2  #t4=j*4 
    add t4, a0, t4
    lw t5, 0(t4) # t5 = arr[j]
    lw t6, 4(t4) # t6 = arr[j+1]
    ble t5, t6, skip_swap
    # Swap arr[j] and arr[j+1]
    sw t6, 0(t4) # arr[j] = arr[j+1]
    sw t5, 4(t4) # arr[j+1] = t5
skip_swap:
    addi t1, t1, 1 # Increment j
    j inner_loop # Jump back to inner loop

outer_next:
    addi t0, t0, 1 # Increment i
    j outer_loop # Jump back to outer loop

done:
    ret 
