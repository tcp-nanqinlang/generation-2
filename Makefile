obj-m := tcp_nanqinlang2.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=/usr/bin/gcc-4.9

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

install:
	install tcp_nanqinlang2.ko /lib/modules/`uname -r`/kernel/net/ipv4
	insmod /lib/modules/`uname -r`/kernel/net/ipv4/tcp_nanqinlang2.ko
	depmod -a
	
uninstall:
	rmmod tcp_nanqinlang2.ko
	rm /lib/modules/`uname -r`/kernel/net/ipv4/tcp_nanqinlang2.ko