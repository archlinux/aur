--- share/support/core/tool_output.py	2021-06-18 15:08:58.357612000 +1000
+++ share/support/core/tool_output.py-new	2021-07-22 02:08:08.422285000 +1000
@@ -52,7 +52,10 @@
         return getattr(self, 'name', self.__name__).lower()
 
 
-class OutputParser(object, metaclass=OutputParserMetaClass):
+#class OutputParser(object, metaclass=OutputParserMetaClass):
+class OutputParser(object):
+    __metaclass__ = OutputParserMetaClass
+
     def __init__(self, child):
         self.child = child
 
