all: cross.diff

cross.diff:
	-diff -ur src.orig src > $@

install:
	tar cvf - src | tar xf - -C /usr

clean:
	rm -f cross.diff
