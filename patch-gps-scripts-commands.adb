--- kernel/src_info/gps-scripts-commands.adb
+++ kernel/src_info/gps-scripts-commands.adb
@@ -267,7 +267,7 @@
         (Instance, Command_Class_Name, Command_Property'
            (Command => Scheduled_Command_Access (Command)));
       Ref (Command_Access (Command));  --  unrefed in GPS.Command.__del__
-      Set (Command.Instances, Language, Instance);
+      Set (Command.Instances, Instance);
    end Set_Instance;
 
    ---------------------
@@ -278,7 +278,7 @@
      (Command  : access Scheduled_Command'Class;
       Language : access Scripting_Language_Record'Class) is
    begin
-      Set (Command.Instances, Language, No_Class_Instance);
+      Set (Command.Instances, No_Class_Instance);
    end Remove_Instance;
 
    --------------

