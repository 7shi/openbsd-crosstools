PREFIX  = /usr/local
DESTDIR = $(PREFIX)/openbsd

#SRCROOT = .
BINDIR  = $(SRCROOT)/bin
INCDIR  = $(SRCROOT)/include
LIBDIR  = $(SRCROOT)/lib

CC     = gcc
AR     = ar
RANLIB = ranlib
STRIP  = strip

CPPFLAGS = -I$(INCDIR) -DREPLACE_GETOPT
LDFLAGS  = -L$(LIBDIR) $(LIBADD) -lobcompat

# Interix
#CPPFLAGS += -I$(SRCROOT)/include/interix -D_ALL_SOURCE

# Hurd
CPPFLAGS += -I$(SRCROOT)/include/hurd -D_BSD_SOURCE -D_XOPEN_SOURCE
