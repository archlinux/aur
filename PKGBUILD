# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=musl-cross-bin
pkgver=11.2.1
pkgrel=1
pkgdesc="Prebuilt musl cross compiler toolchain (x86_64-linux-musl) from musl.cc"
arch=('x86_64')
url="https://musl.cc"
license=('MIT')
makedepends=('coreutils' 'tar' 'gzip')
depends=()
provides=('musl-cross')
conflicts=()
source=("https://more.musl.cc/${pkgver}/x86_64-linux-musl/x86_64-linux-musl-cross.tgz")
sha256sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/opt/cross/x86_64-linux-musl-cross"
  tar -xzf "${srcdir}/x86_64-linux-musl-cross.tgz" \
      -C "${pkgdir}/opt/cross/"
}
