# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.28.1
pkgrel=1
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/jcstr/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-3.28.1.zip::https://github.com/jcstr/i3-gnome/archive/3.28.1.zip)
md5sums=('ed809a42c3ab8e843b7cd0d411bf6330')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

