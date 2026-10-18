# Release checklist

The recipe targets the new `dist/blackbeard-{dark,light}` layout and compiles it
with Dart Sass >= 1.95 and Python. Before publishing, publish upstream tag `v1.1.0`
at the public source URL in PKGBUILD. The development checkout currently uses a
private Gitea origin; AUR users must have a public source they can fetch.

Then run `makepkg --cleanbuild`, inspect package contents, and regenerate metadata
with `makepkg --printsrcinfo > .SRCINFO`. Do not publish the AUR update before the
source tag is available. GIMP is installed separately using upstream install.sh.
