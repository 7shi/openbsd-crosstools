#ifndef __HURD_LIMIT_H__
#define __HURD_LIMIT_H__

#include <sys/types.h>

#ifdef __GNUC__
#define ___GNUC__ __GNUC__
#undef __GNUC__
#endif

#include "/usr/include/limits.h"

#ifdef ___GNUC__
#define __GNUC__ ___GNUC__
#undef ___GNUC__
#endif

#ifndef PATH_MAX
#define PATH_MAX FILENAME_MAX
#endif

#ifndef MAXPATHLEN
#define MAXPATHLEN FILENAME_MAX
#endif

#ifndef __howmany
#define __howmany(x, y) (((x) + ((y) - 1)) / (y))
#endif

#endif
