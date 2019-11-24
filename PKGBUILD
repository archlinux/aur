# Maintainer: Stefano Capitani <stefano@manjaro.org>

pkgname=materiav2-gtk-theme
pkgver=20191124
pkgrel=1
_commit=0f53dafbec3c3572590395719c0a944e2904585a
pkgdesc="A futuristic Material theme for Linux with rounded edges."
arch=(any)
url="https://gitlab.com/Gsbhasin84/materiav2"
license=(MIT)
depends=(gtk3 gnome-themes-extra)
optdepends=('gtk-engine-murrine: for gtk2 theme')
options=(!strip)
source=($url/-/archive/$_commit/materiav2-$_commit.tar.gz)
sha256sums=('f4d55103c3f4badf3a8a7d92b5195296549df2533a749cc4007c80ec778e82eb')

pkgver() {
	date +%Y%m%d
}

package() {
    cd materiav2-$_commit
    mkdir -p $pkgdir/usr/share/themes
    cp -r ./dark/* ./light/* $pkgdir/usr/share/themes
}
