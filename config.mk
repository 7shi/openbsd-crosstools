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
LDFLAGS  = -L$(LIBDIR) -lobcompat

# Interix
CC = gcc
CPPFLAGS += -I$(SRCROOT)/include/interix -D_ALL_SOURCE -DREPLACE_GETOPT
