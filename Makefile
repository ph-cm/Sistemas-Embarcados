# Rule format:
# targets: prerequisites
# 			recipe

# target = .o file
# prerequisites = .c file
# recipe = command line to compile

# Ferramentas do toolchain

CC = arm-none-eabi-gcc
RM = rm -rf

# Diretorios arquivos objeto serao salvos

OBJDIR = build

# Arquivos a serem compilados

SRCS = startup.c \
        main.c

#Flags do compilador e linker

CFLAGS = -g -mcpu=cortex-m4 -mthumb -Wall -O0

# Gera uma lista de arquivos objeto utilizando os arquivos fonte

OBJS = $(patsubst %, $(OBJDIR)/%.o, $(basename $(SRCS)))

# Cria diretorios onde serao armazenados arquivos objeto

$(shell mkdir -p $(dir $(OBJS)) > /dev/null)

all: $(OBJS)

$(OBJDIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) $(OBJDIR)