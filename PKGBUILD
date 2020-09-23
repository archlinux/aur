# Maintainer: zandimna <zandimna@autistici.org>
pkgname=stayawake-bin
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="Advanced wakeup alarm system written in PyQt5"
arch=("x86_64")
url=""
license=('GPL3')
groups=()
depends=('mpg123')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/PolyphasicDevTeam/stayawake/releases/download/0.5-beta/stayawake-0.5.tar.xz")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    true
}

build() {
    mkdir etc
    mkdir usr
    mkdir usr/bin
    mkdir usr/share
    mkdir usr/share/pixmaps
    mkdir usr/share/applications
    true
}

check() {
    true
}

package() {
    mv stayawake usr/bin
    mv stayawake.png usr/share/pixmaps
    mv StayAwake.desktop usr/share/applications
    mv stayawake.conf etc/
    mv etc/ $pkgdir
    mv usr/ $pkgdir

}

md5sums=('b6506ca6e8228edf6aed1a91e9e846fd')
