PREFIX = plasma/wallpapers

.PHONY: install
install:
	cp -r * $(DESTDIR)$(PREFIX)/VideoWallpaper;

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/VideoWallpaper;
