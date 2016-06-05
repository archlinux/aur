--- src/gnatcoll-scripts.adb
+++ src/gnatcoll-scripts.adb
@@ -209,6 +209,40 @@
       Unchecked_Free (List.List);
    end Free;
 
+
+   -------------------
+   -- Get_Instances --
+   -------------------
+
+   function Get_Instances (List : Instance_List) return Instance_Array is
+      Null_List : Instance_Array (1 .. 0);
+   begin
+      if List.List = null then
+         return Null_List;
+      else
+         return List.List.all;
+      end if;
+   end Get_Instances;
+
+   ------------
+   -- Length --
+   ------------
+
+   function Length (List : Instance_List_Access) return Natural is
+--      use GNATCOLL.RefCount;
+      Count : Natural := 0;
+   begin
+      if List /= null and then List.List /= null then
+         for L in List.List'Range loop
+--            if List.List (L).Initialized then
+            if List.List (L).Ref /= Null_Ref then
+               Count := Count + 1;
+            end if;
+         end loop;
+      end if;
+      return Count;
+   end Length;
+
    ---------
    -- Get --
    ---------

