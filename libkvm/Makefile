TARGET  = $(LIBDIR)/libkvm.a
SOURCES = kvm_i386.c \
	kvm.c kvm_file.c kvm_file2.c kvm_getloadavg.c kvm_proc.c \
        kvm_cd9660.c kvm_udf.c kvm_ntfs.c

SRCROOT = ..
include $(SRCROOT)/config.mk

CPPFLAGS = -nostdinc -Iinclude

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p $(LIBDIR)
	$(AR) cvrus $@ $(OBJECTS)

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<

install: $(TARGET)
#	mkdir -p $(DESTDIR)/lib
#	cp $(TARGET) $(DESTDIR)/lib
#	$(RANLIB) $(DESTDIR)/lib/$(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS) *core
