
CROSSPREFIX=/opt/cross-mint/bin/m68k-atari-mint-
PATH = /opt/cross-mint/m68k-atari-mint/bin:/opt/cross-mint/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
LD_LIBRARY_PATH=/opt/cross-mint/lib:/opt/cross-mint/m68k-atari-mint/lib:$LD_LIBRARY_PATH
DESTDIR=/opt/cross-mint/m68k-atari-mint

CC = $(CROSSPREFIX)gcc
AS = $(CC)
AR = $(CROSSPREFIX)ar
RANLIB = $(CROSSPREFIX)ranlib
STRIP = $(CROSSPREFIX)strip
FLAGS = $(CROSSPREFIX)flags

CFLAGS = -Wall
OFLAGS = -O2 -fomit-frame-pointer

SRCS = png.c pngget.c pngrutil.c pngwrite.c pngread.c pngset.c pngtest.c pngwtran.c pngmem.c pngrio.c pngsimd.c pngtrans.c pngwutil.c pngerror.c pngpread.c pngrtran.c pngwio.c
HDRS = pnglibconf.h png.h pngconf.h pngdebug.h pnginfo.h pngpriv.h pngtarget.h pngstruct.h
OBJS = $(SRCS:.c=.o)

libpng.a:
	cp -r $(HDRS) $(DESTDIR)/include
	$(CC) $(CFLAGS) -m68000 $(OFLAGS) -c $(SRCS)
	$(AR) -rcs $@ $(OBJS)
	$(AR) s $@
	cp libpng.a $(DESTDIR)/lib/libpng.a
	rm -f *.o libpng.a
	$(CC) $(CFLAGS) -m68020-60 $(OFLAGS) -c $(SRCS)
	$(AR) -rcs $@ $(OBJS)
	$(AR) s $@
	cp libpng.a $(DESTDIR)/lib/m68020-60/libpng.a
	rm -f *.o libpng.a
	$(CC) $(CFLAGS) -mcpu=5475 $(OFLAGS) -c $(SRCS)
	$(AR) -rcs $@ $(OBJS)
	$(AR) s $@
	cp libpng.a $(DESTDIR)/lib/m5475/libpng.a
	rm -f *.o libpng.a

clean:
	rm -f *.o libpng.a
