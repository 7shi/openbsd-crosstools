TARGET  = ../lib/libcompat.a
SOURCES = bsd-asprintf.c getopt_long.c mktemp.c nlist.c strtoll.c strtonum.c

include ../config.mk

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p ../lib
	$(AR) cvrus $@ $(OBJECTS)

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/lib
	cp $(TARGET) $(DESTDIR)/lib
	$(RANLIB) $(DESTDIR)/lib/$(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS) *core
