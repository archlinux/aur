default: build

build:
    makepkg

rebuild:
    makepkg -f

nobuild:
    makepkg -o

delete-src:
    rm -rf src

delete-build-packages:
    rm -f *.pkg.tar.zst

delete-all: delete-build-packages delete-src

cleanbuild: delete-all
    makepkg -C

srcinfo:
    makepkg --printsrcinfo > .SRCINFO

geninteg:
    makepkg --geninteg

install:
    sudo pacman -U *.pkg.tar.zst --noconfirm

uninstall:
    sudo pacman -Rss dashlane-cli --noconfirm

src-version:
    @cd src/dashlane-cli && git describe --tags

test: cleanbuild
    ./src/dashlane-cli/bundle/dcli-linux --version

test-install: cleanbuild install && uninstall
    dcli --version