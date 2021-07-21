--- share/support/core/modules.py	2021-06-18 15:08:58.357612000 +1000
+++ share/support/core/modules.py-new	2021-07-22 02:05:16.386551000 +1000
@@ -118,13 +118,16 @@
 GPS.Hook("gps_started").add(Module_Metaclass.setup_all_modules)
 
 
-class Module(object, metaclass=Module_Metaclass):
+#class Module(object, metaclass=Module_Metaclass):
+class Module(object):
 
     """
     A Module is a singleton, so this class also ensures that pattern is
     followed. As a result, a Module's __init__ method is only called once.
     """
 
+    __metaclass__ = Module_Metaclass
+
     abstract = True
     # Not a real module, so should never call setup()
 
