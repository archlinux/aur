--- cli/src/gps-cli_messages_windows.adb
+++ cli/src/gps-cli_messages_windows.adb
@@ -59,7 +59,7 @@
      (Instance : Class_Instance;
       Console  : access CLI_Virtual_Console_Record) is
    begin
-      Set (Console.Instances, Get_Script (Instance), Instance);
+      Set (Console.Instances, Instance);
    end Set_Data_Primitive;
 
    ----------

