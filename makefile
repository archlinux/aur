PREFIX = plasma/wallpapers

.PHONY: install
install:
	mkdir $(DESTDIR)$(PREFIX)/VideoWallpaper;
	cp -r * $(DESTDIR)$(PREFIX)/VideoWallpaper;

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/VideoWallpaper;
