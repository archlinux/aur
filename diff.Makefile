--- Makefile	2013-01-23 10:44:04.000000000 -0700
+++ Makefile	2015-01-27 15:39:17.212190481 -0700
@@ -12 +12 @@
-	       	-Wall `wx-config --libs --cxxflags` -o ebook2cwgui
+	       	-Wall `wx-config-2.8 --libs --cxxflags` -o ebook2cwgui
