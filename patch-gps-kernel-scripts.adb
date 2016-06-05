--- kernel/src/gps-kernel-scripts.adb
+++ kernel/src/gps-kernel-scripts.adb
@@ -1818,8 +1818,7 @@
          Trace (Me, "Create a new instance for the current context");
          Instance := New_Instance (Script, Class);
          Set_Data (Instance, Context);
-         Set (Instance_List (Context.Data.Data.Instances.all),
-              Script, Instance);
+         Set (Instance_List (Context.Data.Data.Instances.all), Instance);
 
          if Active (Ref_Me) then
 --              Assert (Ref_Me,

