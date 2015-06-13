# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=nasal
pkgver=1.0.1
pkgrel=1
pkgdesc="A very small but feature rich scripting language."
arch=('i686' 'x86_64')
url="http://plausible.org/nasal/"
license=('GPL')
depends=('glibc')
source=(http://plausible.org/nasal/$pkgname-$pkgver.tar.gz)
md5sums=('fa7e1e45934e1942062d2793903f2925')

build() {
  cd "$pkgname-$pkgver"
  ./configure prefix="$pkgdir"/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install
}

