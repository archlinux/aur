# qt6-imvqml

Release package for [imvqml](https://github.com/alexindigo/imvqml), a Qt Quick
image pipeline with an isolated decoder. Install `mpv` for video-frame capture;
still images do not require it at runtime.

Build with `makepkg -si` in an Arch build environment. The pre-commit hook
regenerates `.SRCINFO` and checks the staged recipe with namcap. On a fresh
checkout, install it with `install -m 755 pre-commit.sh .git/hooks/pre-commit`.
