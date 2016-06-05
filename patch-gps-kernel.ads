--- kernel/src/gps-kernel.ads
+++ kernel/src/gps-kernel.ads
@@ -867,7 +867,7 @@
       Creator   : Abstract_Module;
       Ref_Count : Natural := 1;
 
-      Instances : GNATCOLL.Scripts.Instance_List_Access;
+      Instances : access GNATCOLL.Scripts.Instance_List;
 
       Files             : GNATCOLL.VFS.File_Array_Access := null;
       --  The current selected files

