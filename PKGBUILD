# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=totp
pkgver=0.1
pkgrel=1
pkgdesc="A tiny command line utility to generate OTP tokens"
arch=('x86_64')
url="https://github.com/angt/totp"
license=('BSD')
depends=()
makedepends=('git')
source=("git+$url#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
