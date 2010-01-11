TARGET  = $(BINDIR)/config
SOURCES = files.c gram.c hash.c main.c mkheaders.c mkioconf.c mkmakefile.c \
	mkswap.c pack.c scan.c sem.c util.c \
	ukc.c misc.c ukcutil.c cmd.c exec.c exec_elf.c

SRCROOT = ..
include $(SRCROOT)/config.mk

CPPFLAGS += -Iinclude -D__BSD_VISIBLE=1
LDFLAGS  += -lkvm -ldb

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

gram.c gram.h: gram.y
	bison -o $@ -y -d $<

scan.c: scan.l gram.c
	lex -o $@ $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin
	rm -f $(PREFIX)/bin/obconfig
	ln -s $(DESTDIR)/bin/config $(PREFIX)/bin/obconfig

clean:
	rm -f $(TARGET) $(OBJECTS) scan.c gram.c gram.h
