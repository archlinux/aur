--- ./src/sdl-video-pixel_formats.ads	2020-06-17 01:27:26.000000000 +1000
+++ ./src/sdl-video-pixel_formats.ads-new	2021-08-15 01:06:01.298705154 +1000
@@ -653,8 +653,7 @@
 
          --  This is mainly padding to make sure the record size matches what is expected from C.
          Private_Part : Private_Pixel_Format;
-      end record with
-     Convention => C;
+      end record;
 
    --  TODO: Possibly change this to a controlled type.
    type Pixel_Format_Access is access all Pixel_Format with
