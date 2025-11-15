--- xrdpkeyb/rdpKeyboard.c.orig	2025-07-27 23:05:25 UTC
+++ xrdpkeyb/rdpKeyboard.c
@@ -863,8 +863,8 @@ rdpLoadLayout(rdpKeyboard *keyboard, struct xrdp_clien
 
     int keylayout = client_info->keylayout;
 
-    LLOGLN(0, ("rdpLoadLayout: keylayout 0x%8.8x variant %s display %s",
-               keylayout, client_info->variant, display));
+    LLOGLN(0, ("rdpLoadLayout: keylayout 0x%8.8x variant %s",
+               keylayout, client_info->variant));
     memset(&set, 0, sizeof(set));
     set.rules = g_base_str;
 
