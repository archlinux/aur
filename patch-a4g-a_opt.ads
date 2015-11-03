--- asis/a4g-a_opt.ads-old	2015-11-04 07:49:30.264512698 +1100
+++ asis/a4g-a_opt.ads	2015-11-04 07:49:54.257847015 +1100
@@ -59,7 +59,7 @@
    --  treated as an error: ASIS_Failed is raised and the warning message is
    --  sent to an ASIS Diagnosis string.
 
-   Strong_Version_Check : Boolean := True;
+   Strong_Version_Check : Boolean := False;
    --  Strong version check means that version strings read from the tree and
    --  stored in Gnatvsn are compared. Weak check means comparing ASIS version
    --  numbers. See BA23-002
