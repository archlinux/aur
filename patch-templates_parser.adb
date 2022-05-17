--- ./src/templates_parser.adb	2020-10-31 04:35:33.000000000 +1100
+++ ./src/templates_parser.adb-new	2022-05-17 16:14:23.327865165 +1000
@@ -2079,7 +2079,6 @@
                                         Strings.Both);
                      First, Last : Natural;
                      Next_Last   : Natural;
-                     pragma Unreferenced (Next_Last);
                   begin
                      if Is_Number (Ind_Str) then
                         Ind := Natural'Value (Ind_Str);
