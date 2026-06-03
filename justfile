set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

UPSTREAM := "stalwartlabs/vandelay"

default:
    @just --list

alias u := update
alias p := push

# bump to latest release, refresh sums + .SRCINFO, build
update:
    VER=$(gh release view --repo {{ UPSTREAM }} --json tagName --jq .tagName | sed 's/^v//') && \
        sed -i -e "s/^pkgver=.*/pkgver=$VER/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
    updpkgsums
    makepkg --printsrcinfo > .SRCINFO
    makepkg -f --noconfirm

# commit + push to AUR
push:
    git add PKGBUILD .SRCINFO
    git commit -m "Update to v$(grep '^pkgver=' PKGBUILD | cut -d= -f2)"
    git push origin master

# rm build artifacts
clean:
    rm -rf pkg src *.pkg.tar.* *.tar.xz *.txt
