# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai
pkgver=1.1.1
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/$pkgname"
license=('GPL3')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.zip")
sha256sums=('c7531747e380b144a80ac85031953acf858648409346cbd4e82278bff6703ce5')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
