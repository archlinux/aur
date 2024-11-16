pkgbase:="dashlane-cli-git"

default:
    @just --choose

_install-pacman-contrib:
    @sudo pacman -S pacman-contrib --noconfirm

build:
    @makepkg

rebuild:
    @makepkg -f

nobuild:
    @makepkg -o

_delete-src:
    @rm -rf src || true

_delete-pkg:
    @rm -rf pkg || true

_delete-build-packages:
    @rm -f *.pkg.tar.zst || true

_delete-pkgbase:
    @rm -rf {{ pkgbase }} || true

_delete-all: _delete-build-packages _delete-src _delete-pkg _delete-pkgbase

_cleanbuild: _delete-all
    @makepkg -C

_commit-count:
    @git rev-list --count HEAD

_bump-pkgrel:
    @sed -i "s/pkgrel=[0-9]*/pkgrel=$(just _commit-count)/" PKGBUILD

_srcinfo:
    @makepkg --printsrcinfo > .SRCINFO

_checksum:
    @updpkgsums

_install:
    @sudo pacman -U *.pkg.tar.zst --noconfirm

_uninstall:
    @sudo pacman -R {{ pkgbase }} --noconfirm

_src-version:
    @cd src/{{ pkgbase }} && git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

_tag-name:
    @echo "$(just _src-version).$(just _commit-count)"

prepare: _install-pacman-contrib _bump-pkgrel _checksum _srcinfo rebuild

publish: prepare
    @echo -e "\e[36mNew version: $(just _src-version).$(just _commit-count)\e[0m"
    @git add .
    @echo -e "\e[36mCommitting and tagging...\e[0m"
    @git tag -af $(just _tag-name) -m "bump: $(just _src-version).$(just _commit-count)"
    @git commit -m "bump: $(just _src-version).$(just _commit-count)"
    @echo -e "\e[36mPushing to origin...\e[0m"
    @git push || true
    @git push --tags --force
    @echo -e "\e[36mSwitching to aur master branch...\e[0m"
    @git checkout master
    @echo -e "\e[36mMerging main into aur master...\e[0m"
    @git merge -X theirs --no-edit main
    @echo -e "\e[36mPushing to aur...\e[0m"
    @git push aur master
    @echo -e "\e[36mSwitching back to main...\e[0m"
    @git checkout main

_dcli-bundle-version:
    @echo "Checking version..."
    @./src/{{ pkgbase }}/bundle/dcli-linux --version

_dcli-bundle-sync:
    @echo "Syncing..."
    @./src/{{ pkgbase }}/bundle/dcli-linux sync

test-local: rebuild _dcli-bundle-version _dcli-bundle-sync

test: prepare _install && _dcli-bundle-version _dcli-bundle-sync _uninstall
    @echo "Testing..."

# Maintainance commands

_clean:
    @git clean -dX -n

_clean-force: _delete-all
    @git clean -dX -f

#########################################################
_set-remote-master-to-aur-branch:
    @git branch master --set-upstream-to aur/master
# One-time command to add the aur remote - no further use
_remote-add-aur:
    @git remote add aur ssh://aur@aur.archlinux.org/{{ pkgbase }}.git || true

# One-time command to clone the aur repo - no further use
_clone-empty-aur:
    @git -c init.defaultbranch=master clone ssh://aur@aur.archlinux.org/{{ pkgbase }}.git

