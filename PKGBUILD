# Maintainer: Gabriel M. Dutra <nulldutra@tuta.io>

_name=mgc
pkgname=mgccli-bin
pkgver=0.31.1
pkgrel=1
pkgdesc="Magalu cloud CLI"
arch=('x86_64')
url="https://github.com/MagaluCloud/mgccli"
license=()
source=("https://github.com/MagaluCloud/${_name}cli/releases/download/v${pkgver}/${_name}cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3dbcc713933d5b65cbfd10400d165fcb0b72e94b82f92b73b874e998c6a24a27')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}

