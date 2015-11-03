--- asis/a4g-a_opt.adb-orig	2015-11-04 08:07:22.751223374 +1100
+++ asis/a4g-a_opt.adb	2015-11-04 08:08:19.197892357 +1100
@@ -175,7 +175,7 @@
                when 's' =>
 
                   if Parameter = "-sv" then
-                     Strong_Version_Check := True;
+                     Strong_Version_Check := False;
                   else
                      Unknown_Parameter := True;
                   end if;
@@ -241,7 +241,7 @@
    begin
       Is_Initialized       := False;
       ASIS_Warning_Mode    := Normal;
-      Strong_Version_Check := True;
+      Strong_Version_Check := False;
       Generate_Bug_Box     := True;
       Keep_Going           := False;
    end Set_Off;
