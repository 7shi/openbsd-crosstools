#	$OpenBSD: Makefile,v 1.50 2008/11/04 07:22:35 espie Exp $

include ../config.mk

HOSTCC=${CC}

PROG=	../bin/make
#CFLAGS+= -I${.OBJDIR} -I${.CURDIR}
#HOSTCFLAGS+= -I${.OBJDIR} -I${.CURDIR}
CFLAGS+= --std=c99 -I. ${CPPFLAGS} -DDESTDIR="\"${DESTDIR}\""
HOSTCFLAGS=${CFLAGS}
CDIAGFLAGS=-Wall -W -Wno-char-subscripts -Wstrict-prototypes -pedantic \
	-Wmissing-prototypes

#CDEFS+=-DUSE_TIMESPEC
CDEFS+=-DHAS_BOOL_H
CDEFS+=-DHAS_PATHS_H
#CDEFS+=-DHAS_EXTENDED_GETCWD
#CDEFS+=-DHAS_STATS

CFLAGS+=${CDEFS}
HOSTCFLAGS+=${CDEFS}

SRCS=	arch.c buf.c cmd_exec.c compat.c cond.c dir.c direxpand.c engine.c \
	error.c for.c init.c job.c lowparse.c main.c make.c memory.c parse.c \
	parsevar.c str.c stats.c suff.c targ.c targequiv.c timestamp.c \
	var.c varmodifiers.c varname.c
SRCS+=	lst.lib/lstAddNew.c lst.lib/lstAppend.c lst.lib/lstConcat.c lst.lib/lstConcatDestroy.c \
	lst.lib/lstDeQueue.c lst.lib/lstDestroy.c lst.lib/lstDupl.c lst.lib/lstFindFrom.c lst.lib/lstForEachFrom.c \
	lst.lib/lstInsert.c lst.lib/lstMember.c lst.lib/lstRemove.c lst.lib/lstReplace.c lst.lib/lstRequeue.c lst.lib/lstSucc.c
#.PATH:	${.CURDIR}/lst.lib
OBJS=${SRCS:.c=.o}

all: ${PROG}
${PROG}: ${OBJS}
	mkdir -p ../bin
	${CC} -o $@ ${CDIAGFLAGS} ${CFLAGS} ${OBJS} ${LDFLAGS}
	${STRIP} $@
.c.o:
	${CC} -c -o $@ ${CDIAGFLAGS} ${CFLAGS} $<

CLEANFILES+=generate generate.o regress.o check

#CLEANFILES+=${LIBOBJS} libohash.a
CLEANFILES+= varhashconsts.h condhashconsts.h nodehashconsts.h

beforedepend: varhashconsts.h condhashconsts.h nodehashconsts.h
# may need tweaking if you add variable synonyms or change the hash function
MAGICVARSLOTS=77
MAGICCONDSLOTS=65

varhashconsts.h: generate
	./generate 1 ${MAGICVARSLOTS} > $@

condhashconsts.h: generate
	./generate 2 ${MAGICCONDSLOTS} >$@

nodehashconsts.h: generate
	./generate 3 0 >$@

generate: generate.c stats.c memory.c
	${HOSTCC} ${LDSTATIC} -o $@ ${HOSTCFLAGS} $^ ${LDADD}

check: regress.o str.o memory.o buf.o
	${CC} -o $@ ${CFLAGS} $^ ${LDADD}

regress: check
	${.OBJDIR}/check 

# kludge for people who forget to make depend
var.o: varhashconsts.h
cond.o: condhashconsts.h
targ.o parse.o: nodehashconsts.h
var.ln: varhashconsts.h
cond.ln: condhashconsts.h
targ.ln parse.ln: nodehashconsts.h

#.if make(install)
#SUBDIR+= PSD.doc
#.endif

install: ${PROG}
	mkdir -p ${DESTDIR}/bin
	cp ${PROG} ${DESTDIR}/bin
	mkdir -p ${DESTDIR}/share/mk
	cp mk/* ${DESTDIR}/share/mk

#.PHONY:		regress

clean:
	rm -f ${CLEANFILES} ${PROG} ${OBJS}
