# Maintainer: Luc Saccoccio--Le Guennec <lucsaccoccio@disroot.org>
pkgname=zamonia-bin
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Zamonia - Executable only - CLI tool to manage work database"
url="https://github.com/Luc-Saccoccio/zamonia"
license=('MIT')
arch=('x86_64')
depends=('gmp')
conflicts=()
provides=()
replaces=()
optdepends=()

# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Luc-Saccoccio/zamonia/releases/download/v${pkgver}/zamonia-${pkgver}.tar.gz")

sha512sums=('b247dcc2672eeadb87cb1f75a5429fa8f0246a648389087ce2bc544ff00e2724fa485ccdd2beac1aaa324a4490872f22150999c2142f56f661b13640a8c5bc8d')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  cp zamonia "${pkgdir}/usr/bin"
}
