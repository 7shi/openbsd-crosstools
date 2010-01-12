TARGET  = $(BINDIR)/make
SOURCES = arch.c buf.c cmd_exec.c compat.c cond.c dir.c direxpand.c engine.c \
	error.c for.c init.c job.c lowparse.c main.c make.c memory.c parse.c \
	parsevar.c str.c stats.c suff.c targ.c targequiv.c timestamp.c \
	var.c varmodifiers.c varname.c \
	lst.lib/lstAddNew.c lst.lib/lstAppend.c lst.lib/lstConcat.c lst.lib/lstConcatDestroy.c \
	lst.lib/lstDeQueue.c lst.lib/lstDestroy.c lst.lib/lstDupl.c lst.lib/lstFindFrom.c lst.lib/lstForEachFrom.c \
	lst.lib/lstInsert.c lst.lib/lstMember.c lst.lib/lstRemove.c lst.lib/lstReplace.c lst.lib/lstRequeue.c lst.lib/lstSucc.c
HEADERS = varhashconsts.h condhashconsts.h nodehashconsts.h
MKDIR   = $(DESTDIR)/share/mk

SRCROOT = ..
include $(SRCROOT)/config.mk

CPPFLAGS += --std=c99 -I. -DHAS_BOOL_H -DHAS_PATHS_H \
	-D_PATH_OBJDIRPREFIX="\"${DESTDIR}/obj\"" \
	-D_PATH_DEFSYSPATH="\"${MKDIR}\""

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(HEADERS) $(OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

generate: generate.c stats.c memory.c
	$(CC) -o $@ $(CPPFLAGS) $< $(LDFLAGS)

varhashconsts.h: generate
	./generate 1 77 > $@

condhashconsts.h: generate
	./generate 2 65 >$@

nodehashconsts.h: generate
	./generate 3 0 >$@

OBMAKE = $(PREFIX)/bin/obmake

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin
	mkdir -p $(MKDIR)
	cp mk/* $(MKDIR)
	mkdir -p $(PREFIX)/bin
	echo "#!/bin/sh" > $(OBMAKE)
	echo 'PATH="$(DESTDIR)/bin:$$PATH" $(DESTDIR)/bin/make $$@' >> $(OBMAKE)
	chmod 755 $(OBMAKE)

clean:
	rm -f $(TARGET) $(OBJECTS) $(HEADERS)
