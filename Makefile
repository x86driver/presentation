TARGET = my-arg my-back my-nm my-fault
#CC = gcc
#CC = arm-none-linux-gnueabi-gcc
CC = droid-gcc
x86CC = gcc
x86C++ = g++

all:$(TARGET)

my-arg:my-arg.c
	$(CC) -Wall -g -o $@ $<

my-back:my-back.c
	$(x86CC) -Wall -g -o $@ $<

my-nm:my-nm.cpp
	$(x86C++) -Wall -g -o $@ $<

my-fault:my-fault.c
	$(x86CC) -Wall -o $@ $<

clean:
	rm -rf $(TARGET)

