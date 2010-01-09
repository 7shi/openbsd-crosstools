DESTDIR = /usr/local/i386-openbsd

AR     = ar
RANLIB = ranlib
STRIP  = strip

CPPFLAGS = -I../include
LDFLAGS  = -L../lib

# Interix
CC = gcc
CPPFLAGS += -I../interix/include -D_ALL_SOURCE -DREPLACE_GETOPT
LDFLAGS  += -lcompat
