# Rule format:
# targets: prerequisites
# 			recipe

# target = .o file
# prerequisites = .c file
# recipe = command line to compile


CC = arm-none-eabi-gcc
CFLAGS = -g -mcpu=cortex-m4 -mthumb -O0 -Wall

#Generalizando mais as regras, usando variaveis automaticas
main.o: main.c
	$(CC) -c $(CFLAGS) $< -o $@

startup.o: startup.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f *.o