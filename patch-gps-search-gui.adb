--- kernel/src/gps-search-gui.adb
+++ kernel/src/gps-search-gui.adb
@@ -927,7 +927,7 @@
            (Inst, "Search_Result", Result_Property_Record'(Result => Result));
 
          if Result.all in Python_Search_Result'Class then
-            Set (Python_Search_Result (Result.all).Inst, Script, Inst);
+            Set (Python_Search_Result (Result.all).Inst, Inst);
          end if;
       end if;
 
@@ -996,8 +996,7 @@
             --  Provider is set in the handler for "next", before returning
             --  the type to Ada.
 
-            Set (Python_Search_Result (Props.Result.all).Inst,
-                 Get_Script (Inst), Inst);
+            Set (Python_Search_Result (Props.Result.all).Inst, Inst);
          end if;
 
          return Props;
@@ -1140,7 +1139,7 @@
             Provider := new Python_Search_Provider;
             Provider.Name := new String'(Name);
             Provider.Inst := Null_Instance_List;
-            Set (Provider.Inst, Get_Script (Inst), Inst);
+            Set (Provider.Inst, Inst);
             Provider.Kernel := Get_Kernel (Data);
 
             Registry.Register (Provider);
@@ -1257,6 +1256,7 @@
       Pattern : not null access GPS.Search.Search_Pattern'Class;
       Limit   : Natural := Natural'Last)
    is
+      use gnatcoll.Scripts;
       Inst : constant Instance_Array := Get_Instances (Self.Inst);
       Result : Class_Instance;
       pragma Warnings (Off, Result);

