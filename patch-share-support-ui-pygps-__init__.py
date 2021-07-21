--- share/support/ui/pygps/__init__.py	2021-06-23 15:03:03.040414000 +1000
+++ share/support/ui/pygps/__init__.py-new	2021-07-22 02:06:52.486421000 +1000
@@ -24,7 +24,8 @@
 
 import GPS
 import sys
-from pynput.keyboard import Key, Controller
+#import pynput
+#from pynput.keyboard import Key, Controller
 
 global last_sent_event
 last_sent_event = None
@@ -127,7 +128,8 @@
         def __iter__(self):
             return self
 
-        def __next__(self):
+        # def __next__(self):
+        def next(self):
             # Never delete elements from self.to_traverse, otherwise pygobject
             # will call decref on it, and it is possible that the gtk+ widget
             # will be destroyed as a result
@@ -176,7 +178,8 @@
         def __iter__(self):
             return self
 
-        def __next__(self):
+        # def __next__(self):
+        def next(self):
             # Never delete elements from self.to_traverse, otherwise pygobject
             # will call decref on it, and it is possible that the gtk+ widget
             # will be destroyed as a result
