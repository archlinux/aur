# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=arroyo
pkgver=0.14.0
pkgrel=1
epoch=
pkgdesc="cloud-native stream processing"
arch=('aarch64' 'x86_64')
url="https://github.com/ArroyoSystems/arroyo/releases"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://github.com/ArroyoSystems/arroyo/releases/download/v${pkgver}/arroyo-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ArroyoSystems/arroyo/releases/download/v${pkgver}/arroyo-linux-aarch64.tar.gz")
sha256sums_x86_64=('f74c5a60ac2d39fa3c21acfee22b6a8a32b3a40a29389b9bdddd4ba700b3bba4')
noextract=()

package() {
  cd "$srcdir/$pkgname-linux-${CARCH}"

  install -D -m755 arroyo $pkgdir/usr/bin/arroyo
}

# vim:set ts=2 sw=2 et:
