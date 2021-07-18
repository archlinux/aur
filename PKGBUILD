# Maintainer Alfred Jophy alfredjophy@protonmail.com
pkgname=xkcd-gtk
pkgdesc="Comic Sticks (xkcd-gtk) is a simple xkcd comic viewer written in Go using GTK+3."
pkgver=1.4.2
pkgrel=1
url="https://github.com/rkoesters/xkcd-gtk"
arch=('x86_64')
license=('GPL3')
source=("https://github.com/rkoesters/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')
makedepends=(go gtk3)
package() { 
        cd $pkgname-$pkgver
        make install prefix="$pkgdir/usr/local"
}
