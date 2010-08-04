TARGET = my-arg
#CC = gcc
CC = arm-none-linux-gnueabi-gcc

all:$(TARGET)

my-arg:my-arg.c
	$(CC) -Wall -g -o $@ $<

clean:
	rm -rf $(TARGET)

