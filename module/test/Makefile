obj-m :=test.o

PWD := $(shell pwd)  
all:  
	#make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules 
	make -C ~/samba/job/repo_buildroot/output/meson8b_m201_mainland/build/linux M=$(PWD) modules
clean:
	rm *.o *.ko *~ *.mod.c *.order *.symvers
