# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
pkgname=protopedal
pkgver=2.5
pkgrel=1
pkgdesc="Compatibility tool for sim racing pedals and force feedback steering wheels"
arch=('x86_64')
url="https://gitlab.com/openirseny/protopedal/"
license=('EUPL')
depends=()
makedepends=(
  unzip
  gcc
  glibc
)
source=(https://gitlab.com/openirseny/protopedal/-/releases/release-$pkgver/downloads/protopedal-v$pkgver.zip)
sha256sums=('88762a3ced274676868bbd871df33c6a445777d158527904b4b2b98c85e6be4b')

package() {
  install -D -m755 "$srcdir/protopedal" "$pkgdir/usr/bin/protopedal"
}
