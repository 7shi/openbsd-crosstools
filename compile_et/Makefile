TARGET  = compile_et
SOURCES = compile_et.c error_table.c et_lex.lex.c

include ../config.mk

all: $(TARGET)

OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(STRIP) $@

.c.o:
	$(CC) -c -o $@ $(CPPFLAGS) $<

et_lex.lex.c: et_lex.lex.l
	flex -o $@ $<

compile_et.c: error_table.c

error_table.c error_table.h: error_table.y
	bison -o $@ -d $<

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin

clean:
	rm -f $(TARGET) $(OBJECTS) et_lex.lex.c error_table.c error_table.h
