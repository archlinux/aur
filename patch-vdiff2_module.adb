--- vdiff/src/vdiff2_module.adb
+++ vdiff/src/vdiff2_module.adb
@@ -459,7 +459,7 @@
          Trace (Me, "Create a new instance of the current visual diff");
          Instance := New_Instance (Script, Class);
          Set_Vdiff_Data (Instance, Diff_Head_Access (Vdiff));
-         Set (Vdiff.Instances.all, Script, Instance);
+         Set (Vdiff.Instances.all, Instance);
       end if;
 
       return Instance;

