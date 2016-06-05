--- vdiff/src/diff_utils2.adb
+++ vdiff/src/diff_utils2.adb
@@ -732,7 +732,7 @@
             end loop;
          end;
 
-         Free (Link.Instances);
+         Free (Link.Instances.all);
       end if;
    end Free;
 

