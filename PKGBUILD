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

sha256sums=('3a5b96fda88d0341ec754e87b1bd3c4d709055f100cc5726e9ae4e26a82bcfa9'
            '8899df45cca8f97bfa04143216cad98634b8f29eabaa5b241ab5300fa5c30f69')

package(){
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_bin} "${pkgdir}/usr/bin/${_bin}"
}

