# Maintainer: demfabris <demfabris at gmail dot com>
pkgname=rmx-bin
_bin="rmx"
pkgver=0.1.5
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

sha256sums=('6510ae59b2558538a222ae8e1b1e85d40244f1e9efae59fe1d7f3cd21f6bfdcd')

package(){
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_bin} "${pkgdir}/usr/bin/${_bin}"
}

