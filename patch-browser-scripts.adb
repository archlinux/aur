--- browsers/src/browsers-scripts.adb
+++ browsers/src/browsers-scripts.adb
@@ -329,7 +329,7 @@
       --  always get access to the python custom data in callbacks.
       Set_Data (Inst, "Browsers.Item",
                 Item_Properties_Record'(Item => Abstract_Item (Self)));
-      Set (List.all, Get_Script (Inst), Inst);
+      Set (List.all, Inst);
    end Set_Instance;
 
    -----------------------
@@ -337,6 +337,7 @@
    -----------------------
 
    procedure Destroy_Instances (Self : not null access Python_Item'Class) is
+      use GNATCOLL.Scripts;
       List : constant Instance_List_Access := Self.Inst_List;
       Arr  : constant Instance_Array := Get_Instances (List.all);
    begin

