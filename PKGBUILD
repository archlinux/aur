# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.30.0
pkgrel=1
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/csxr/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-3.30.0.zip::https://github.com/csxr/i3-gnome/archive/3.30.0.zip)
md5sums=('c8e4e99eb2cb8021553cde9a5613e136')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

