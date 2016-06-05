--- kernel/src/gps-kernel.adb
+++ kernel/src/gps-kernel.adb
@@ -710,7 +710,7 @@
          end if;
 
          String_List_Utils.String_List.Free (Data.Activities);
-         Free (Data.Instances);
+         Free (Data.Instances.all);
       end Free;
 
       Tmp     : Instance_List_Access;
@@ -723,16 +723,17 @@
             Trace (Ref_Me, "Before decref context: ("
                    & System.Address_Image (To_Address (Data))
                    & " " & Data.Ref_Count'Img & ") in instances="
-                   & Length (Data.Instances)'Img);
+                   & Length (Instance_List_Access (Data.Instances))'Img);
          end if;
 
          --  Some references to the selection are hold by the instance list
          --  stored in the selection, so we need to break the cycle here
 
-         if Data.Ref_Count = Length (Data.Instances) + 1 then
-            Tmp := Data.Instances;
+         if Data.Ref_Count = Length (Instance_List_Access (Data.Instances)) + 1
+         then
+            Tmp := Instance_List_Access (Data.Instances);
             Data.Instances := null;
-            Free (Tmp);
+            Free (Tmp.all);
          end if;
 
          Data.Ref_Count := Data.Ref_Count - 1;
@@ -1266,18 +1267,19 @@
      (Kernel : access Kernel_Handle_Record;
       Tool   : not null Tool_Properties)
    is
-      Pkg  : Package_Node_Id;
+      Pkg  : GPR.Package_Node_Id;
       Attr : Attribute_Node_Id;
       Elm  : Tool_Properties;
       Iter : Tools_List.Cursor;
       use Tools_List;
+      use type GPR.Package_Node_Id;
    begin
       Name_Len := Length (Tool.Project_Package);
       Name_Buffer (1 .. Name_Len) :=
         To_Lower (To_String (Tool.Project_Package));
       Pkg := Package_Node_Id_Of (Name_Find);
 
-      if Pkg = Empty_Package then
+      if Pkg = GPR.Empty_Package then
          Register_New_Package (To_String (Tool.Project_Package), Pkg);
       end if;
 

