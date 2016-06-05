*** asis/a4g-encl_el.adb	2016-05-16 19:17:27.000000000 +1000
--- asis/a4g-encl_el.adb-new	2016-06-04 11:32:33.972410280 +1000
***************
*** 2798,2804 ****
  
              if Nkind (Rough_Result_Node) = N_Subprogram_Body
                and then not (Comes_From_Source (Rough_Result_Node))
!               and then Was_Expression_Function (Rough_Result_Node)
              then
                 Set_Int_Kind
                   (Rough_Result_Element, An_Expression_Function_Declaration);
--- 2798,2804 ----
  
              if Nkind (Rough_Result_Node) = N_Subprogram_Body
                and then not (Comes_From_Source (Rough_Result_Node))
!               and then Sinfo.Was_Expression_Function (Rough_Result_Node)
              then
                 Set_Int_Kind
                   (Rough_Result_Element, An_Expression_Function_Declaration);
