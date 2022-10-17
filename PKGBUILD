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

sha256sums=('3b3006029b5735d8c34c204f5f4ca01631546de7e5c1e75dfbfe4f0c7c5dafdd')

package(){
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_bin} "${pkgdir}/usr/bin/${_bin}"
}

