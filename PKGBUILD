# Maintainer:  <https://aur.archlinux.org/users/vorbote>

pkgname=dwm-gnome
pkgver=7.2
pkgrel=1
pkgdesc="Starts suckless DWM wrapped in a GNOME session."
arch=('any')
url="https://github.com/palopezv/dwm-gnome/"
license=('MIT')
depends=('dwm')
source=($pkgname-$pkgver.tar.gz::https://github.com/palopezv/dwm-gnome/archive/$pkgver.tar.gz)
b2sums=('5d63958879e1ead22b8feb5b8ea33fc02a7b2457533969f33c9d011a194cfe6b512c31b496accfa03f35e17bbca6060a7e9d3b215116867ae16f39e695efa96b')

build() {
  cd "$pkgname-$pkgver"
  
  make
  
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  
}
