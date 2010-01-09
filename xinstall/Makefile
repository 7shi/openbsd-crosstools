TARGET  = ../bin/install
SOURCES = xinstall.c

include ../config.mk

CPPFLAGS += -DIGNORE_OWNER

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	mkdir -p ../bin
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin

clean:
	rm -f $(TARGET) $(OBJECTS)
