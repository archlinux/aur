--- views/src/bookmark_views.adb
+++ views/src/bookmark_views.adb
@@ -1066,7 +1066,7 @@
       if Inst = No_Class_Instance then
          Inst := New_Instance (Script, Class);
          Set_Data (Inst, Class, Bookmark_List.Data (List).Name.all);
-         Set (Bookmark_List.Data (List).Instances, Script, Inst);
+         Set (Bookmark_List.Data (List).Instances, Inst);
       end if;
 
       return Inst;

