# Maintainer: demfabris <demfabris at gmail dot com>
pkgname=rmx-bin
_bin="rmx"
pkgver=0.1.6
pkgrel=1
pkgdesc="Multiplatform port of GNU rm with extra features and improved performance"
arch=("x86_64")
url="https://github.com/demfabris/rmx"
license=("Apache")
provides=("rmx-bin")
conflicts=("rmx-bin" "rmx-git")
source=(
  "rmx.tar.gz::https://github.com/demfabris/rmx/releases/download/v${pkgver}/${_bin}-musl-${CARCH}.tar.gz"
)

sha256sums=('7b268524970f123585fde76ce7fa34a154f53e1eb59153c2cca551e5784f2691')

package(){
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_bin} "${pkgdir}/usr/bin/${_bin}"
}

