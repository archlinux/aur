# Maintainer: archblux <archlubx@126.com>
pkgname=vnt-bin
_pkgname=vnt-bin
pkgver=1.2.15
pkgrel=1
pkgdesc="一个简单、高效、能快速组建虚拟局域网的工具"
arch=("x86_64")
url="https://github.com/vnt-dev/vnt/"
license=("Apache-2.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vnt-dev/vnt/releases/download/${pkgver}/vnt-x86_64-unknown-linux-musl-${pkgver}.tar.gz")
sha256sums=("e453268e36b95a643c0ec897fda8caf0eea52d848e82cded1635e05249bbb38f")

package() {
  cd "${srcdir}"
  install -Dm755 vnt-cli "${pkgdir}/usr/bin/vnt-cli"
  install -Dm755 vn-link-cli "${pkgdir}/usr/bin/vnt-link-cli"
}


