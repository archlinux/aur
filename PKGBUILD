# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

_name=mgc
pkgname=mgccli-bin
pkgver=0.53.0
pkgrel=1
pkgdesc="Magalu cloud CLI"
arch=('x86_64')
url="https://github.com/MagaluCloud/mgccli"
license=()
source=("https://github.com/MagaluCloud/${_name}cli/releases/download/v${pkgver}/${_name}cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fdb88ae099923e56eb02c033a5695041b5f029b15aafc74b77f44f4f8cfcd48e')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}

