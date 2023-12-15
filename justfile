pkgbase:="dashlane-cli-git"

default:
    @just --choose

build:
    @makepkg

rebuild:
    @makepkg -f

nobuild:
    @makepkg -o

delete-src:
    @rm -rf src || true

delete-pkg:
    @rm -rf pkg || true

delete-build-packages:
    @rm -f *.pkg.tar.zst || true

delete-pkgbase:
    @rm -rf {{ pkgbase }} || true

delete-all: delete-build-packages delete-src delete-pkg delete-pkgbase

cleanbuild: delete-all
    @makepkg -C

srcinfo:
    @makepkg --printsrcinfo > .SRCINFO

checksum:
    @updpkgsums

install:
    @sudo pacman -U *.pkg.tar.zst --noconfirm

uninstall:
    @sudo pacman -R {{ pkgbase }} --noconfirm

src-version:
    @cd src/{{ pkgbase }} && git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

prepare: rebuild checksum srcinfo

publish: prepare
    @echo "New version: $(just src-version)"
    @git add .
    @echo "Committing and tagging..."
    @git commit -m "bump: $(just src-version)"
    @git tag -a $(just src-version) -m "bunp: $(just src-version)"
    @echo "Pushing to origin..."
    @git push
    @git push --tags
    @echo "Switching to aur master branch..."
    @git checkout master
    @echo "Merging main into aur master..."
    @git merge main
    @echo "Pushing to aur..."
    @git push aur master
    @git push --tags aur master
    @echo "Switching back to main..."
    @git checkout main

dcli-bundle-version:
    @./src/{{ pkgbase }}/bundle/dcli-linux --version

dcli-bundle-sync:
    @./src/{{ pkgbase }}/bundle/dcli-linux sync

test-local: rebuild dcli-bundle-version dcli-bundle-sync

test: prepare install && uninstall
    @dcli --version


# Maintainance commands

clean:
    @git clean -dX -n

clean-force: delete-all
    @git clean -dX -f


#########################################################
set-remote-master-to-aur-branch:
    @git branch master --set-upstream-to aur/master
# One-time command to add the aur remote - no further use
remote-add-aur:
    @git remote add aur ssh://aur@aur.archlinux.org/{{ pkgbase }}.git || true

# One-time command to clone the aur repo - no further use
clone-empty-aur:
    @git -c init.defaultbranch=master clone ssh://aur@aur.archlinux.org/{{ pkgbase }}.git

