pkgbase:="dashlane-cli-git"

default: publish

build:
    makepkg

rebuild:
    makepkg -f

nobuild:
    makepkg -o

delete-src:
    rm -rf src || true

delete-pkg:
    rm -rf pkg || true

delete-build-packages:
    rm -f *.pkg.tar.zst || true

delete-all: delete-build-packages delete-src delete-pkg

cleanbuild: delete-all
    makepkg -C

srcinfo:
    makepkg --printsrcinfo > .SRCINFO

checksum:
    updpkgsums

install:
    sudo pacman -U *.pkg.tar.zst --noconfirm

uninstall:
    sudo pacman -Rss {{ pkgbase }} --noconfirm

src-version:
    @cd src/{{ pkgbase }} && git describe --tags

prepare: rebuild checksum srcinfo

publish: prepare
    echo "New version: $(just src-version)"
    git add .
    echo "Committing and tagging..."
    git commit -m "Update to $(just src-version)"
    git tag -a $(just src-version) -m "Release $(shell make src-version)"
    echo "Pushing to origin..."
    git push
    git push --tags
    echo "Pushing to aur..."
    git push aur master
    git push --tags aur master

test-local: rebuild
    ./src/{{ pkgbase }}/bundle/dcli-linux --version

test: prepare install && uninstall
    dcli --version

remote-add-aur:
    git remote add aur ssh://aur@aur.archlinux.org/{{ pkgbase }}.git