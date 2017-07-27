# Maintainer: Jesús Castro <51v4n@openmailbox.org>
pkgname=i3-gnome
pkgver=5.1
pkgrel=3
pkgdesc="Starts i3 inside a gnome session."
arch=('any')
url="https://github.com/TheMarex/i3-gnome"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-5.1.zip::https://github.com/TheMarex/i3-gnome/archive/5.1.zip)
md5sums=('c9a547518532b7b7f31e9f3574a2c03c')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
