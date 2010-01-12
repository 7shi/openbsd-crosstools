TARGET  = $(LIBDIR)/libobcompat.a
SOURCES = bsd-asprintf.c fgetln.c getopt_long.c glibc.c mktemp.c nlist.c \
	setmode.c strlcat.c strlcpy.c strtoll.c strtonum.c unvis.c vis.c \
	ohash/ohash_create_entry.c \
	ohash/ohash_delete.c \
	ohash/ohash_do.c \
	ohash/ohash_entries.c \
	ohash/ohash_enum.c \
	ohash/ohash_init.c \
	ohash/ohash_interval.c \
	ohash/ohash_lookup_interval.c \
	ohash/ohash_lookup_memory.c \
	ohash/ohash_qlookup.c \
	ohash/ohash_qlookupi.c

SRCROOT = ..
include $(SRCROOT)/config.mk

CPPFLAGS += --std=c99

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p $(LIBDIR)
	rm -f $@
	$(AR) cvrus $@ $(OBJECTS)

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<

install: $(TARGET)
#	mkdir -p $(DESTDIR)/lib
#	cp $(TARGET) $(DESTDIR)/lib
#	$(RANLIB) $(DESTDIR)/lib/$(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS) *core
