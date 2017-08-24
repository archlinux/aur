# Maintainer:  <https://aur.archlinux.org/users/vorbote>

pkgname=dwm-gnome
pkgver=5.2
pkgrel=1
pkgdesc="Starts suckless dwm wrapped in a gnome session."
arch=('any')
url="https://github.com/palopezv/dwm-gnome/"
license=('MIT')
depends=('dwm')
source=($pkgname-$pkgver.tar.gz::https://github.com/palopezv/dwm-gnome/archive/$pkgver.tar.gz)
sha384sums=('d6d5d2448090e03949a13ee398ec1d207855a3955256924c532794456bade291d28938253a2ec26405610bce695b950f')

build() {
  cd "$pkgname-$pkgver"
  
  make
  
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  
}
