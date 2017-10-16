diff --git a/vendor/Makefile.in b/vendor/Makefile.in
index 5f746740..921d70a1 100644
--- a/vendor/Makefile.in
+++ b/vendor/Makefile.in
@@ -90,7 +90,7 @@ install-tcllib:
 	rm -rf $(DESTDIR)$(TCL_PACKAGE_PATH)/tcllib1.1{5,7}
 	@echo ===\> making $(@:%-tcllib=%) in ${DIRPRFX}@VENDOR_TCLLIB_SUBDIR@
 	@umask 0022; $(MAKE) -C @VENDOR_TCLLIB_SUBDIR@ @VENDOR_TCLLIB_INSTALL@
-	@chmod -R ugo+rX ${PREFIX}/libexec/macports/lib/tcllib*
+	@chmod -R ugo+rX $(DESTDIR)${PREFIX}/libexec/macports/lib/tcllib*
 
 test:
 
