--- toolchains_editor/core/src/toolchains-parsers.ads
+++ toolchains_editor/core/src/toolchains-parsers.ads
@@ -161,7 +161,7 @@
    type Toolchain_Parser_Record
      (Enclosing_Parser : access Project_Parser_Record)
    is record
-      Node_Data        : Project_Node_Tree_Ref;
+      Node_Data        : GPR.Tree.Project_Node_Tree_Ref;
       Project          : Parsed_Project;
 
       Error            : String_Access;
@@ -186,7 +186,7 @@
       Manager                : Toolchain_Manager;
 
       Tree_Data              : Project_Tree_Ref;
-      Node_Data              : Project_Node_Tree_Ref;
+      Node_Data              : GPR.Tree.Project_Node_Tree_Ref;
       Enclosing_Project_Node : Project_Node_Id;
       Root_Project_Node      : Project_Node_Id;
       Is_Valid               : Boolean := False;
@@ -202,7 +202,7 @@
 
    type Parsed_Project_Record is record
       Project_Node : Project_Node_Id;
-      Node_Data    : Project_Node_Tree_Ref;
+      Node_Data    : GPR.Tree.Project_Node_Tree_Ref;
       Variables    : Tree_Node_Maps.Map;
       Path         : Virtual_File;
       Is_Root      : Boolean;
@@ -211,7 +211,7 @@
    procedure Initialize
      (This         : Parsed_Project;
       Parser       : in out Project_Parser_Record;
-      Node_Data    : Project_Node_Tree_Ref;
+      Node_Data    : GPR.Tree.Project_Node_Tree_Ref;
       Project_Node : Project_Node_Id);
 
 end Toolchains.Parsers;
