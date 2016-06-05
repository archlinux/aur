--- src/gnatcoll-scripts.ads
+++ src/gnatcoll-scripts.ads
@@ -766,6 +766,12 @@
    --  Stores the instance created for some GPS internal data, so that the same
    --  script instance is reused every time we reference the same Ada object.
 
+   type Instance_List_Access is access all Instance_list;
+
+   type Instance_Array is array (Natural range <>) of Class_Instance;
+   type Instance_Array_Access is access Instance_Array;
+
+
    type Inst_Cursor is private;
    function First (Self : Instance_List) return Inst_Cursor;
    procedure Next (Self : Instance_List; Pos : in out Inst_Cursor);
@@ -777,6 +783,12 @@
 
    procedure Free (List : in out Instance_List);
    --  Free the instances stored in the list
+
+   function Get_Instances (List : Instance_List) return Instance_Array;
+   --  Return the instance array contained in the given list
+
+   function Length (List : Instance_List_Access) return Natural;
+   --  Return the number of instances that are stored in the list
 
    function Get
      (List   : Instance_List;
@@ -1575,8 +1587,6 @@
       Console : Virtual_Console;
    end record;
 
-   type Instance_Array is array (Natural range <>) of Class_Instance;
-   type Instance_Array_Access is access Instance_Array;
    type Instance_List is record
       List : Instance_Array_Access;
       --  instances are stored in no particular order. As soon as a

