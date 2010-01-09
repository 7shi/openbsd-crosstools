TARGET  = ../bin/config
SOURCES = files.c gram.c hash.c main.c mkheaders.c mkioconf.c mkmakefile.c \
	mkswap.c pack.c scan.c sem.c util.c \
	ukc.c misc.c ukcutil.c cmd.c exec.c exec_elf.c

include ../config.mk

CPPFLAGS += -Iinclude -D__BSD_VISIBLE=1
LDFLAGS  += -lkvm -ldb

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p ../bin
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

scan.c: scan.l
	flex -o $@ $<

gram.c gram.h: gram.y
	bison -o $@ -d $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin

clean:
	rm -f $(TARGET) $(OBJECTS) scan.c gram.c gram.h
