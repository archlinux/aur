--- Makefile.org	2008-01-30 17:00:53.000000000 -0700
+++ Makefile	2008-02-03 23:20:58.000000000 -0700
@@ -6,21 +6,17 @@
 	@echo "Nothing to do. make install|uninstall|clean|dist [DESTDIR=/usr]"
 
 install:
-	sed 's^prefix="/usr"^prefix="$(DESTDIR)"^g' yfksubs.pl > yfksubs2.pl 
-	sed 's^prefix="/usr"^prefix="$(DESTDIR)"^g' yfk > yfk2 
 	chmod 0755 yfk
 	install -d -v				$(DESTDIR)/share/yfklog/
 	install -d -v				$(DESTDIR)/share/yfklog/labels/
 	install -d -v				$(DESTDIR)/bin/
-	install -m 0755 yfk2		$(DESTDIR)/bin/yfk 
-	install -m 0444 yfksubs2.pl	$(DESTDIR)/share/yfklog/yfksubs.pl
+	install -m 0755 yfk		$(DESTDIR)/bin/yfk 
+	install -m 0444 yfksubs.pl	$(DESTDIR)/share/yfklog/yfksubs.pl
 	install -m 0444 db_* 		$(DESTDIR)/share/yfklog/
 	install -m 0444 cty.dat		$(DESTDIR)/share/yfklog/
 	install -m 0444 config		$(DESTDIR)/share/yfklog/
 	install -m 0444 p.png		$(DESTDIR)/share/yfklog/
 	install -m 0444 *.lab		$(DESTDIR)/share/yfklog/labels/
-	rm -f yfksubs2.pl
-	rm -f yfk2
 
 uninstall:
 	rm -f  $(DESTDIR)/bin/yfk
