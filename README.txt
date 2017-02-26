Getting started
===============

1. Download the emulator package from https://apple2.gs/plus and put it in a folder.
   Yes, you can drag it into your Applications on a Mac, but be aware that it is
   meant to be launched from a command line.  If you put it in Applications, you
   should be able to run it with the terminal command:
     /Applications/GSplus.app/Contents/MacOS/gsplus

2. Download the Apple IIgs Firmware ROMs, for either a ROM01 or ROM03 machine.
    (If you have a real IIgs, there are ways to save it from your machine too.)
   Try: ftp://ftp.apple.asimov.net/pub/apple_II/emulators/rom_images/
   a. Put the ROM image in the same folder where you run the emulator from.
      It will search for:  "ROM", "ROM.01", "ROM.03"
      If your ROM file has some other name, launch gsplus and hit F4 to go to
      the config menu to choose your ROM under "ROM File Selection"
     ... or ...

3. Edit your config:
   You can manually edit the config.txt file (or use the F4 menu.)
   You can set disks using a slot/number syntax like:
     s5d1 = images/ArkanoidII.po
     s6d1 = images/ProDOS_2_4_1.dsk
     s7d1 = images/gsos.2mg

   You can also manually set your ROM path like:
     g_cfg_rom_path = ../roms/gsrom03

3. Get some Apple IIgs software.
   I recommend the excellent Apple IIgs dedicated site:
    http://www.whatisthe2gs.apple2.org.za/
   If you have a real IIgs, you can transfer your disks using ADTPro
    http://adtpro.sourceforge.net/

5. Boot the Apple IIgs by running the emulator
    Windows:                gsplus32.exe
    Mac/Ubuntu:             ./gsplus
    Mac (if in Apps)        /Applications/GSplus.app/Contents/MacOS/gsplus

   If the config file can’t be found, it will try to create a config.txt file for you,
   with all of the defaults.

   Note: You can also specify a config file.  This is very useful as you can have specific
   disks/setting pre-set in a config file and launch directly into your favorite game with
   that config.  They can be named anything you want, though the officially recognized
   extensions are .txt and .gsp.

   Examples:
    Windows:                gsplus32.exe -config arkanoid.gsp
     Mac/Ubuntu:            ./gsplus -config choplifter_config.txt
