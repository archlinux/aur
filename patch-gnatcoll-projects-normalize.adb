--- src/gnatcoll-projects-normalize.adb	2016-05-16 19:34:28.000000000 +1000
+++ src/gnatcoll-projects-normalize.adb-new	2016-07-03 08:01:32.926640074 +1000
@@ -2204,6 +2204,9 @@
 
             when N_Comment =>
                null;
+
+            when N_Split =>
+               null;
          end case;
       end if;
 
