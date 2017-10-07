# Maintainer: Jesús Castro <x51v4n@gmail.com>
# Contributors: @killajoe, @Snowmobil, @ThomasWeiser (GitHub)
pkgname=i3-gnome
pkgver=3.0
pkgrel=7
epoch=1
pkgdesc="Starts i3 inside a gnome session."
arch=('any')
url="https://github.com/lvillani/i3-gnome/"
license=('MIT')
depends=('i3-wm')
source=(i3-gnome-3.0.zip::https://github.com/lvillani/i3-gnome/archive/3.0.zip)
md5sums=('bf68e20252e6ae9dcc386b868a20f591')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
