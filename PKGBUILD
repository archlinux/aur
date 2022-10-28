pkgname=aptos-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc='The aptos tool is a command line interface (CLI) for debugging, development, and node operations'
arch=("x86_64")
license=("Apache")
url='https://github.com/aptos-labs/aptos-core'
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Ubuntu-x86_64.zip")
sha256sums=('30a4299c450758316ead5c51fb409feee5e62877a03811d7d745695e263bcea6')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
