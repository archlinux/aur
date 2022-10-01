pkgname=aptos-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.7
pkgrel=1
pkgdesc='The aptos tool is a command line interface (CLI) for debugging, development, and node operations'
arch=("x86_64")
license=("Apache")
url='https://github.com/aptos-labs/aptos-core'
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Ubuntu-x86_64.zip")
sha256sums=('97a7911eb4dc652e9cabde9fe096db47f4cfd5483e3c39d6dc9e2b22616e0a7e')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
