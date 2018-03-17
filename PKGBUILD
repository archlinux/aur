# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.26.2
pkgrel=9
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/51v4n/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-3.26.2.zip::https://github.com/51v4n/i3-gnome/archive/3.26.2.zip)
md5sums=('1873c021339073c6204c349bf1677bc9')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
