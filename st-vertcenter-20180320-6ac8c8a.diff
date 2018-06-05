--- a/x.c	Tue Mar 20 00:28:57 2018
+++ b/x.c	Tue Mar 20 00:29:02 2018
@@ -80,6 +80,7 @@
 	int w, h; /* window width and height */
 	int ch; /* char height */
 	int cw; /* char width  */
+	int cyo; /* char y offset */
 	int mode; /* window state/mode flags */
 	int cursor; /* cursor style */
 } TermWindow;
@@ -949,6 +950,7 @@
 	/* Setting character width and height. */
 	win.cw = ceilf(dc.font.width * cwscale);
 	win.ch = ceilf(dc.font.height * chscale);
+	win.cyo = ceilf(dc.font.height * (chscale - 1) / 2);
 
 	FcPatternDel(pattern, FC_SLANT);
 	FcPatternAddInteger(pattern, FC_SLANT, FC_SLANT_ITALIC);
@@ -1130,7 +1132,7 @@
 	FcCharSet *fccharset;
 	int i, f, numspecs = 0;
 
-	for (i = 0, xp = winx, yp = winy + font->ascent; i < len; ++i) {
+	for (i = 0, xp = winx, yp = winy + font->ascent + win.cyo; i < len; ++i) {
 		/* Fetch rune and mode for current glyph. */
 		rune = glyphs[i].u;
 		mode = glyphs[i].mode;
@@ -1155,7 +1157,7 @@
 				font = &dc.bfont;
 				frcflags = FRC_BOLD;
 			}
-			yp = winy + font->ascent;
+			yp = winy + font->ascent + win.cyo;
 		}
 
 		/* Lookup character index with default font. */
@@ -1371,12 +1373,12 @@
 
 	/* Render underline and strikethrough. */
 	if (base.mode & ATTR_UNDERLINE) {
-		XftDrawRect(xw.draw, fg, winx, winy + dc.font.ascent + 1,
+		XftDrawRect(xw.draw, fg, winx, winy + win.cyo + dc.font.ascent + 1,
 				width, 1);
 	}
 
 	if (base.mode & ATTR_STRUCK) {
-		XftDrawRect(xw.draw, fg, winx, winy + 2 * dc.font.ascent / 3,
+		XftDrawRect(xw.draw, fg, winx, winy + win.cyo + 2 * dc.font.ascent / 3,
 				width, 1);
 	}
 
