# Maintainer: Alfred Jophy <alfredjophy[at]protonmail[dot]com>
pkgname=xkcd-gtk
pkgdesc="A simple xkcd comic viewer written in Go using GTK+3."
pkgver=1.4.2
pkgrel=1
url="https://github.com/rkoesters/xkcd-gtk"
arch=('x86_64')
license=('GPL3')
source=("https://github.com/rkoesters/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(41f528a69705490cb8f53b0404d70edf628d418e69806f2685c64d573f4202b9)
makedepends=(go gtk3)
build() { 
        cd $pkgname-$pkgver
        make 
}

package() { 
        cd $pkgname-$pkgver
        make install prefix="$pkgdir/usr"
}
