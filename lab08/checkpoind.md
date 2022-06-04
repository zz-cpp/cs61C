# Exercise 1 - Working with CAMERA
1. 32 word
2. TLB Hits: 2; TLB Missess: 8; Page Hits: 0; Page Faults: 8
3. No; because the physical is devide four frame and the TLB size is also four,they are reponsed each other.Every access is the first acess TLB ,if the  TLB doesn't exit,the physical  memory does't contain too. when the physical change,the page table,TLB change as it.So the page is not used; NO.
4. the virtual address is break into two parts of page and offset. When first access with it,using page of the address to check whether the physical page number excit in TLB. If it does, combating the physical page number and offset to the physcial address and then access in memory. If TLB Misses,we check in page table to look for pyhsical page number(however,in the case of physical pages equal entry of TLB,the page table is invalid,so if TLB Misses,then Page Faults).It must be Page Faults. So,we must choose a physical page(if it's full, we must remove one with LRU strategy) load the data into physical page and update the TLB and page table.

# Exercise 2 - Misses
check 01.png;
Because  virtual page of the workload of memory access is not different and it most contain 4 entry in TLB and 4 physical page,so if there are four different virtual page nums in four virtual address,it can promise that ten memory accesses results in ten TLB Misses and ten Page Faults.

# Exercise 3 - Fixing our Faults
we can increase pyhsical Memory to get more page frames or reduce TLB size;
Because when physical frames more than TLB entrys,the page table can contain more status ,so when TLB MISS,we can check into page table.

# Exercise 4 - Bringing it All Together

appletviewer https://denninginstitute.com/workbenches/vmsim/vm.html 

1. The physical memory has 16 physical frames and page table has 32 entrys.
2. p1,p2,p3,p4 is process in VMSIM simulation.
3. because it has 4 process and differnt process does't see their TLB eacher and even though the virtual num is same. And the they will affect each other when the access physical memory to chaage  virtual address mapping that pyhsical pagenum.
