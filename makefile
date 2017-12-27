ICONSIZES := 16 24 32 48 64 72 96 128 256
IMGMAGICK := $(shell command -v convert 2> /dev/null)
DESTDIR := 
PREFIX := usr/local
define \n


endef

install: GBM.exe $(foreach size,$(ICONSIZES),gbm_$(size)x$(size).png)
#rename it in a way, it can easily started from terminal
	install -d $(DESTDIR)/$(PREFIX)/bin;
	install gbm.sh $(DESTDIR)/$(PREFIX)/bin/gbm;
	install -d $(DESTDIR)/$(PREFIX)/share/gbm/;
	install GBM.exe $(DESTDIR)/$(PREFIX)/share/gbm/;
#install icon in different sizes
	$(foreach size,$(ICONSIZES),install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/$(size)x$(size)/apps/;$(\n))
	$(foreach size,$(ICONSIZES),install -m644 gbm_$(size)x$(size).png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/$(size)x$(size)/apps/gbm.png;$(\n))
#install .desktop file, which is used for running gbm from desktop and menus
	install -d $(DESTDIR)/$(PREFIX)/share/applications/
	install -m644 gbm.desktop $(DESTDIR)/$(PREFIX)/share/applications/gbm.desktop
ifeq ($(DESTDIR),)
		-xdg-icon-resource forceupdate --mode system;
		-xdg-desktop-menu forceupdate --mode system;
endif

uninstall: $(DESTDIR)/$(PREFIX)/bin/gbm
	-rm $(DESTDIR)/$(PREFIX)/bin/gbm;
	-rm -r $(DESTDIR)/$(PREFIX)/share/gbm/;
	$(foreach size,$(ICONSIZES),-rm $(DESTDIR)/$(PREFIX)/share/icons/hicolor/$(size)x$(size)/apps/gbm.png;$(\n))
	-rm $(DESTDIR)/$(PREFIX)/share/applications/gbm.desktop
ifeq ($(DESTDIR),)
		-xdg-icon-resource forceupdate --mode system;
		-xdg-desktop-menu forceupdate --mode system;
endif

gbm_%.png: gbm.ico
ifndef IMGMAGICK
	$(error "convert is not available, please install imagemagick")
endif
#extracts the correct ico index appended to the filename from identify’s output
	$(eval INDEX := $(shell identify gbm.ico | grep $* | cut -d" " -f1;))
	convert '$(INDEX)' '$@';
