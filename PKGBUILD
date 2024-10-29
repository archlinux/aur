# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f41-backgrounds
pkgver=41.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 41 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('6b40707b4b8fd675e4a8f7f5a9155c8117d861bc25c16bb6d68123a0b072f6dfb1a9ec446fca66dd60035d974a2e76e1e371949aef72455a5a189f7455c53e1a')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
