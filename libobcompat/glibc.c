#ifndef _BSD_SOURCE
void obcompat_init() {}
#else
extern int *__errno_location();
int *__errno() { return __errno_location(); }

void *__sF[3];
extern void *stdin, *stdout, *stderr;
void obcompat_init()
{
	__sF[0] = stdin;
	__sF[1] = stdout;
	__sF[2] = stderr;
}

#include <db_185.h>
#define _dbopen dbopen
#undef dbopen
void *dbopen(const char *file, int flags, int mode, DBTYPE type, const void *openinfo)
{
	return _dbopen(file, flags, mode, type, openinfo);
}
#endif
