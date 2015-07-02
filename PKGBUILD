# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=lsdbus
pkgver=0.1
pkgrel=5
pkgdesc="A message bus scanner."
arch=('i686' 'x86_64')
url="http://pbbuttons.berlios.de/projects/lsdbus/"
license=('GPL')
depends=('dbus-glib')
makedepends=('dbus-glib')

source=(ftp://ftp.berlios.de/pub/pbbuttons/lsdbus-0.1.tgz)
md5sums=('ea1c8366a8a7d617d18f97f56ce8b34e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install "$pkgname" "$pkgdir/usr/bin/"
}
