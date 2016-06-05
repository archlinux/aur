--- toolchains_editor/core/src/toolchains-parsers.adb
+++ toolchains_editor/core/src/toolchains-parsers.adb
@@ -55,7 +55,7 @@
 
    procedure Parse
      (This      : in out Toolchain_Parser_Record;
-      Node_Data : Project_Node_Tree_Ref;
+      Node_Data : GPR.Tree.Project_Node_Tree_Ref;
       IDE_Node  : Project_Node_Id);
    --  Parse the toolchain contained in the IDE node given in parameter
 
@@ -87,7 +87,7 @@
 
    procedure Parse
      (This      : in out Toolchain_Parser_Record;
-      Node_Data : Project_Node_Tree_Ref;
+      Node_Data : GPR.Tree.Project_Node_Tree_Ref;
       IDE_Node  : Project_Node_Id)
    is
       Manager : constant Toolchain_Manager := Get_Manager
@@ -1457,7 +1457,7 @@
    procedure Initialize
      (This         : Parsed_Project;
       Parser       : in out Project_Parser_Record;
-      Node_Data    : Project_Node_Tree_Ref;
+      Node_Data    : GPR.Tree.Project_Node_Tree_Ref;
       Project_Node : Project_Node_Id)
    is
       Source_File    : Source_File_Index;

