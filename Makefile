# Rule format:
# targets: prerequisites
# 			recipe

# target = .o file
# prerequisites = .c file
# recipe = command line to compile

# Ferramentas do toolchain

CC = arm-none-eabi-gcc

# Arquivos a serem compilados

SRCS = startup.c \
        main.c

#Flags do compilador e linker

CFLAGS = -g -mcpu=cortex-m4 -mthumb -Wall -O0

# Gera uma lista de arquivos objeto utilizando os arquivos fonte

OBJS = $(patsubst %, %.o, $(basename $(SRCS)))

all: $(OBJS)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f *.o