ifneq ($(KERNELRELEASE),)
	obj-m := hello.o
else
	KDIR ?= /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) KCFLAGS="$(KCFLAGS)" modules
clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
endif


