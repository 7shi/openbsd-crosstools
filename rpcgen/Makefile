TARGET  = $(BINDIR)/rpcgen
SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c rpc_parse.c rpc_scan.c \
	rpc_svcout.c rpc_util.c rpc_sample.c rpc_tblout.c

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
