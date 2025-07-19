
# Airwindows Consolidated

This is Arch AUR package for the binary release of Airwindows Consolidated,
a giant and fantastic collection of audio processing plugins from Chris.

"Handsewn bespoke digital audio".

https://www.airwindows.com/


'Consolidated' is an effort to take his hundreds of individual plugins, and
create a single DAW plug, with docs and organization.



# Steps to Update the Package

- Update the `_airwin` variable in the `PKGBUILD` file to match
  the latest release found [here](https://github.com/baconpaul/airwin2rack/releases/tag/DAWPlugin).
- Bump the `pkgver`.
- Run `updpkgsums`.
- Run `makepkg -i` and ensure things work.
- Run `makepkg --printsrcinfo > .SRCINFO`.
- Go make some music.
