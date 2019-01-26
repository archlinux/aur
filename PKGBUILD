# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.30.2
pkgrel=1
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/csxr/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-3.30.2.zip::https://github.com/csxr/i3-gnome/archive/3.30.2.zip)
md5sums=('873321d087d16fae8e7448f8f5a10918')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


