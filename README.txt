Build notes:
1. Put these files in your AUR package directory.
2. Run: updpkgsums
3. Run: makepkg -si
4. Generate .SRCINFO before publishing:
   makepkg --printsrcinfo > .SRCINFO

Notes:
- This package is designed to install alongside the regular Opera browser.
- It integrates nwjs-ffmpeg-prebuilt so streaming sites work out of the box.
- It normalizes the installed path to /usr/lib/opera-gx and uses /etc/opera-gx/default.
