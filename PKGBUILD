# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.32.1
pkgrel=2
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/jcstr/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=($pkgname-$pkgver.zip::https://github.com/jcstr/i3-gnome/archive/$pkgver.zip)
md5sums=('927c38bb3c92b1cf6a018af93acf5be9')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

