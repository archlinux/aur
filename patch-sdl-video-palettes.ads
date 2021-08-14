--- ./src/sdl-video-palettes.ads	2020-06-17 01:27:26.000000000 +1000
+++ ./src/sdl-video-palettes.ads-new	2021-08-15 01:13:17.306319118 +1000
@@ -121,7 +121,7 @@
          Data : Internal_Palette_Access;
       end record;
 
-   type Palette_Constant_Access is access constant Palette;
+   type Palette_Constant_Access is access constant Palette'Class;
 
    type Cursor is
       record
