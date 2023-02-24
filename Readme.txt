-----------------------------------------------------------------------Package-----------------------------------------------------------------------  
This package is a version of SDL2 that can be used to run CS:GO natively on Wayland. I created this package, because running CS:GO on Wayland seems
to make the game feel more fluid (especially mouse input). I have tested it with KDE on Wayland. I will try to update this if there are problematic
CS:GO updates. The SDL2 file in this library is straight from the Arch Linux Archive.


----------------------------------------------------------------------How to use---------------------------------------------------------------------
Add ```SDL_DISPLAYDRIVER=wayland LD_PRELOAD="${LD_PRELOAD}:/usr/lib/libSDL2-csgo.so"``` to CS:GO launch options. If you don't want Steam overlay add
```SDL_DISPLAYDRIVER=wayland LD_PRELOAD="/usr/lib/libSDL2-csgo.so"``` instead to the launch options. At the time of creating this package Steam
overlay showed the FPS counter, but opening it makes it get stuck on the screen.
