include config.mk

SUBDIRS = interix make mkdep config mtree readlink rpcgen compile_et

all install clean:
	for dir in $(SUBDIRS); do (cd $$dir && $(MAKE) $@) || exit 1; done
