# Maintainer: Jesús Castro <51v4n@openmailbox.org>
pkgname=i3-gnome
pkgver=2.0
pkgrel=4
pkgdesc="Starts i3 inside a gnome session."
arch=('any')
url="https://github.com/TheMarex/i3-gnome"
license=('MIT')
depends=('i3-wm')
#source=(i3-gnome-5.1.zip::https://github.com/TheMarex/i3-gnome/archive/5.1.zip)
source=(i3-gnome-2.0.zip::https://github.com/lvillani/i3-gnome/archive/2.0.zip)
md5sums=('755decb52dc4baad4d8c4d6854b4356a')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
