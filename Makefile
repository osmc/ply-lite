INSTALL=/usr/bin/install
CC=gcc
STRIP=strip
ply-image: ply-image.c ply-frame-buffer.c checkmodifier.c Makefile
	$(CC) ply-image.c ply-frame-buffer.c -o ply-image -lpng12 -lm -lz
	$(STRIP) ply-image
	$(CC) checkmodifier.c -o checkmodifier
	$(STRIP) checkmodifier

install:
	$(INSTALL) -d $(DESTDIR)/sbin
	$(INSTALL) -d $(DESTDIR)/usr/bin
	$(INSTALL) -m 755 -c ply-image $(DESTDIR)/usr/bin/ply-image
	$(INSTALL) -m 755 -c checkmodifier $(DESTDIR)/sbin/checkmodifier
	$(INSTALL) -m 755 -c splash_early $(DESTDIR)/sbin/splash_early
	$(INSTALL) -m 644 -c splash.png $(DESTDIR)/usr/splash.png
	$(INSTALL) -m 644 -c splash_sad.png $(DESTDIR)/usr/splash_sad.png
clean:
	rm -f ply-image
	rm -f checkmodifier
