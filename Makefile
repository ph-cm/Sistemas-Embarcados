# Rule format:
# targets: prerequisites
# 			recipe

# target = .o file
# prerequisites = .c file
# recipe = command line to compile

CC = arm-none-eabi-gcc
CFLAGS = -g -mcpu=cortex-m4 -mthumb -O0 -Wall

main.o: main.c
	$(CC) -c $(CFLAGS) main.c -o main.o

clean:
	rm -f *.o