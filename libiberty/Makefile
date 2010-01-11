TARGET = $(LIBDIR)/libiberty.a

SRCROOT = ..
include $(SRCROOT)/config.mk

all: $(TARGET)

src/Makefile:
	cd src && sh configure

$(TARGET): src/Makefile
	cd src && $(MAKE)
	$(AR) cvrus $@ src/*.o ../libobcompat/mktemp.o

install: $(TARGET)
	mkdir -p $(PREFIX)/lib
	cp $(TARGET) $(PREFIX)/lib
	$(RANLIB) $(PREFIX)/lib/$(TARGET)

clean:
	rm -f $(TARGET) src/*.o src/testsuite/Makefile
	for f in Makefile config.h config.log config.status libiberty.a \
	    needed-list required-list stamp-h stamp-picdir xhost-mkfrag; \
	    do rm -f src/$$f; done
