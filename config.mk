PREFIX  = /usr/local
DESTDIR = $(PREFIX)/openbsd

#SRCROOT = .
BINDIR  = $(SRCROOT)/bin
INCDIR  = $(SRCROOT)/include
LIBDIR  = $(SRCROOT)/lib

AR     = ar
RANLIB = ranlib
STRIP  = strip

CPPFLAGS = -I$(INCDIR)
LDFLAGS  = -L$(LIBDIR)

# Interix
CC = gcc
CPPFLAGS += -I$(SRCROOT)/interix/include -D_ALL_SOURCE -DREPLACE_GETOPT
LDFLAGS  += -lcompat
