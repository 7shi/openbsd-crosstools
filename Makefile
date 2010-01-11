include config.mk

SUBDIRS = libobcompat \
	make mkdep libkvm config mtree readlink \
	rpcgen compile_et chown xinstall libiberty

all install clean:
	for dir in $(SUBDIRS); do (cd $$dir && $(MAKE) $@) || exit 1; done
