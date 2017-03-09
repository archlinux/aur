--- kcat_panel.cxx	2017-02-28 14:35:13.718501623 -0700
+++ kcat_panel.cxx	2017-02-28 14:45:21.065909383 -0700
@@ -64 +64 @@
-  visit_URL((void *)("http://www.w1hkj.com/kcat-help/index.html"));
+  visit_URL((void *)("file:///usr/share/doc/kcat/index.html"));
@@ -94 +94 @@
- {"On-line help", 0,  (Fl_Callback*)cb_mnuOnLineHelp, 0, 128, FL_NORMAL_LABEL, 0, 14, 0},
+ {"Off-line help", 0,  (Fl_Callback*)cb_mnuOnLineHelp, 0, 128, FL_NORMAL_LABEL, 0, 14, 0},
