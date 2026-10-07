# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=45
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.3
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://forge.fedoraproject.org/design/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://forge.fedoraproject.org/design/backgrounds/releases/download/v$pkgver/f$_fedoraver-backgrounds-$pkgver.tar.xz")
b2sums=('5243cf5966be3354b04038073bc71e745feea6ea58cee1cfa6f6daeafbd477bc2623a99899d2615cad8ee5171429713c4ee56fd4297ecf68e321e41d9938893a')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
