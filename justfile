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

commit-count:
    @git rev-list --count HEAD

bump-pkgrel:
    @sed -i "s/pkgrel=[0-9]*/pkgrel=$(just commit-count)/" PKGBUILD

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

tag-name:
    @echo "$(just src-version).$(just commit-count)"

prepare: rebuild bump-pkgrel checksum srcinfo

publish: prepare
    @echo -e "\e[36mNew version: $(just src-version)\e[0m"
    @git add .
    @echo -e "\e[36mCommitting and tagging...\e[0m"
    @git tag -af $(just tag-name) -m "bump: $(just src-version).$(just commit-count)"
    @git commit -m "bump: $(just src-version).$(just commit-count)"
    @echo -e "\e[36mPushing to origin...\e[0m"
    @git push || true
    @git push --tags --force
    @echo -e "\e[36mSwitching to aur master branch...\e[0m"
    @git checkout master
    @echo -e "\e[36mMerging main into aur master...\e[0m"
    @git merge main
    @echo -e "\e[36mPushing to aur...\e[0m"
    @git push aur master
    @echo -e "\e[36mSwitching back to main...\e[0m"
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

