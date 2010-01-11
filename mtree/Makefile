TARGET  = $(BINDIR)/mtree
SOURCES = compare.c crc.c create.c misc.c mtree.c spec.c verify.c

SRCROOT = ..
include $(SRCROOT)/config.mk

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin

clean:
	rm -f $(TARGET) $(OBJECTS)
