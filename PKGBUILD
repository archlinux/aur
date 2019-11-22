# Maintainer: Stefano Capitani <stefano@manjaro.org>

pkgname=materiav2-gtk-theme
pkgver=20191122
pkgrel=1
_commit=27cc05ab05c645443e650efb49eebe68ab7ec519
pkgdesc="A futuristic Material theme for Linux with rounded edges."
arch=(any)
url="https://gitlab.com/Gsbhasin84/materiav2"
license=(MIT)
depends=(gtk3 gnome-themes-extra)
optdepends=('gtk-engine-murrine: for gtk2 theme')
options=(!strip)
source=($url/-/archive/$_commit/materiav2-$_commit.tar.gz)
sha256sums=('73c31d350b5e53ff9a7dcd08ebfd0fb468b82d001e042a3cb585b1072ac3b750')

pkgver() {
	date +%Y%m%d
}

package() {
    cd materiav2-$_commit
    mkdir -p $pkgdir/usr/share/themes
    cp -r ./dark/* ./light/* $pkgdir/usr/share/themes
}
