:znova
@echo off
cls
echo    NAZEV      OBTIZNOST    AUTOR           NAZEV      OBTIZNOST AUTOR
echo.
echo 1. 002        stredni      ota.nedved   G. jen_sudy   stredni   jan.noska
echo 2. 1dol       lehka        dozd         H. klice      lehka     schmid84
echo 3. 2dol       extra lehka  dozd         I. level002   tezka     radek.sanda
echo 4. 3dol       lehka        dozd         J. morbid     lehka     tomix
echo 5. apoc       stredni      apocalyps    K. msmid01    lehka     michalsmid
echo 6. bach-01    stredni      bach         L. msmid02    lehka     michalsmid
echo 7. bach-02    stredni      bach         M. pes        trenink   schmid84
echo 8. bach-03    stredni      bach         N. petval     stredni   pwl
echo 9. bbb        trenink      duomhomi     O. pokus      stredni   radek.sanda
echo 0. bludist2   lehka        duomhomi     P. rb         stredni   jan.noska
echo A. bludiste   lehka        schmid84     Q. reedic1    stredni   dolezall
echo B. dudu2      stredni      dudu         R. super      stredni   tomix
echo C. dudu4      lehka        dudu         S. tomhrad2   lehka     tomix
echo D. dudu6      lehka        dudu         T. uueasy     lehka     dolezall
echo E. eagle2     lehka        7pzo         U. vp         stredni   jan.noska
echo F. hradek1    stredni      tomix        V. zicho2     stredni   michal.lichvar
echo.
choice /c:1234567890ABCDEFGHIJKLMNOPQRSTUVZ /n "Zvolte jednu z moznosti... (Z pro opusteni) "
if errorlevel 33 goto konec
if errorlevel 32 berusky u urovne\zicho2.lv3
if errorlevel 31 berusky u urovne\vp.lv3
if errorlevel 30 berusky u urovne\uueasy.lv3
if errorlevel 29 berusky u urovne\tomhrad2.lv3
if errorlevel 28 berusky u urovne\super.lv3
if errorlevel 27 berusky u urovne\reedic1.lv3
if errorlevel 26 berusky u urovne\rb.lv3
if errorlevel 25 berusky u urovne\pokus.lv3
if errorlevel 24 berusky u urovne\petval.lv3
if errorlevel 23 berusky u urovne\pes.lv3
if errorlevel 22 berusky u urovne\msmid02.lv3
if errorlevel 21 berusky u urovne\msmid01.lv3
if errorlevel 20 berusky u urovne\morbid.lv3
if errorlevel 19 berusky u urovne\level002.lv3
if errorlevel 18 berusky u urovne\klice.lv3
if errorlevel 17 berusky u urovne\jen_sudy.lv3
if errorlevel 16 berusky u urovne\hradek1.lv3
if errorlevel 15 berusky u urovne\eagle2.lv3
if errorlevel 14 berusky u urovne\dudu6.lv3
if errorlevel 13 berusky u urovne\dudu4.lv3
if errorlevel 12 berusky u urovne\dudu2.lv3
if errorlevel 11 berusky u urovne\bludiste.lv3
if errorlevel 10 berusky u urovne\bludist2.lv3
if errorlevel 9 berusky u urovne\bbb.lv3
if errorlevel 8 berusky u urovne\bach-03.lv3
if errorlevel 7 berusky u urovne\bach-02.lv3
if errorlevel 6 berusky u urovne\bach-01.lv3
if errorlevel 5 berusky u urovne\apoc.lv3
if errorlevel 4 berusky u urovne\3dol.lv3
if errorlevel 3 berusky u urovne\2dol.lv3
if errorlevel 2 berusky u urovne\1dol.lv3
if errorlevel 1 berusky u urovne\002.lv3
goto znova
:konec
