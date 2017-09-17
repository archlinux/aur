# Maintainer: Jesús Castro <x51v4n@gmail.com>
pkgname=i3-gnome
pkgver=2.1
pkgrel=5
epoch=1
pkgdesc="Starts i3 inside a gnome session."
arch=('any')
url="https://github.com/lvillani/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-2.1.zip::https://github.com/lvillani/i3-gnome/archive/2.1.zip)
md5sums=('21b832c7faedd11373343362a244c6b9')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
