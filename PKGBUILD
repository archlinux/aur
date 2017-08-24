# Maintainer:  <https://aur.archlinux.org/users/vorbote>

pkgname=dwm-gnome
pkgver=6.0
pkgrel=1
pkgdesc="Starts suckless dwm wrapped in a gnome session."
arch=('any')
url="https://github.com/palopezv/dwm-gnome/"
license=('MIT')
depends=('dwm')
source=($pkgname-$pkgver.tar.gz::https://github.com/palopezv/dwm-gnome/archive/$pkgver.tar.gz)
sha384sums=('ff347c6f608b952229eb627976073fe973086af9346d913f35f2f68ccdc18ad10d4cd5cea441a61780f648fa7b99636e')

build() {
  cd "$pkgname-$pkgver"
  
  make
  
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  
}
