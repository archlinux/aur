# Maintainer: Sebastien MacDougall-Landry

pkgname=moonglmath
pkgver=0.6
pkgrel=1
pkgdesc='Math library for MoonGL'
url='https://github.com/stetre/moonglmath/'
source=("https://github.com/stetre/$pkgname/archive/v$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
depends=('lua')
sha256sums=('5ae8937d6e0510c77455c934a1e9e5e1627eb1036c969ef4f28f97ff213d9590')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make LUAVER=5.4
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make LUAVER=5.4 PREFIX="$pkgdir/usr" install
}
