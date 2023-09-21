--- Makefile	2019-08-02 14:19:09.000000000 -0600
+++ Makefile	2019-08-25 14:15:21.372601889 -0600
@@ -6,23 +6,19 @@
 	@echo "Nothing to do. make install|uninstall|clean|dist [DESTDIR=/usr]"
 
 install:
-	sed 's^prefix="/usr"^prefix="$(DESTDIR)"^g' yfksubs.pl > yfksubs2.pl 
-	sed 's^prefix="/usr"^prefix="$(DESTDIR)"^g' yfk > yfk2 
 	chmod 0755 yfk
 	install -d  				$(DESTDIR)/share/yfklog/
 	install -d  				$(DESTDIR)/share/doc/yfklog/doc/
 	install -d  				$(DESTDIR)/share/yfklog/labels/
 	install -d  				$(DESTDIR)/bin/
-	install -m 0755 yfk2		$(DESTDIR)/bin/yfk 
-	install -m 0444 yfksubs2.pl	$(DESTDIR)/share/yfklog/yfksubs.pl
+	install -m 0755 yfk		$(DESTDIR)/bin/yfk 
+	install -m 0444 yfksubs.pl	$(DESTDIR)/share/yfklog/yfksubs.pl
 	install -m 0444 db_* 		$(DESTDIR)/share/yfklog/
 	install -m 0444 cty.dat		$(DESTDIR)/share/yfklog/
 	install -m 0444 config		$(DESTDIR)/share/yfklog/
 	install -m 0444 p.png		$(DESTDIR)/share/yfklog/
 	install -m 0444 *.lab		$(DESTDIR)/share/yfklog/labels/
 	install -m 0444 doc/*		$(DESTDIR)/share/doc/yfklog/doc/
-	rm -f yfksubs2.pl
-	rm -f yfk2
 
 uninstall:
 	rm -f  $(DESTDIR)/bin/yfk
