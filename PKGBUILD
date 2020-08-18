# Maintainer: Jojii <jojii@gmx.net>

pkgname=fantome-gtk
pkgver=1.0.0
pkgrel=1
pkgdesc="Breeze widget theme for GTK 2 and 3"
arch=(any)
url='https://github.com/addy-dclxvi/gtk-theme-collections/tree/master/Fantome'
src="https://github.com/addy-dclxvi/gtk-theme-collections"
license=(GPLv3)
depends=()
makedepends=()
groups=()

build(){
    git clone --depth 1 $src
}

package() {
    cd gtk-theme-collections/Fantome/
    mkdir -vp $pkgdir/usr/share/themes/Fantome
    cp -r gtk-2.0 gtk-3.0 index.theme $pkgdir/usr/share/themes/Fantome
}

