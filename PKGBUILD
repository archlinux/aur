# Maintainer: Gabriel M. Dutra <me@nulldutra.me>

_name=mgc
pkgname=mgccli-bin
pkgver=0.18.10
pkgrel=1
pkgdesc="Magalu cloud CLI"
arch=('x86_64')
url="https://github.com/MagaluCloud/mgccli"
license=()
source=("https://github.com/MagaluCloud/${_name}cli/releases/download/v${pkgver}/${_name}cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9fe48f918feabf0b6373b675629f2c8ed15588f74ecf9a9c04f6590c88aee83b')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}

