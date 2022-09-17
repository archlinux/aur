# Maintainer: Rvn0xsy <rvn0xsy@gmail.com>
# Contributor: Rvn0xsy <rvn0xsy@gmail.com>
pkgname="aptos-bin"
_pkgname="${pkgname%-bin}"
pkgver="0.3.4"
pkgrel="1"
pkgdesc="The aptos tool is a command line interface (CLI) for debugging, development, and node operations."
arch=("x86_64")
license=("Apache")
url='https://github.com/aptos-labs/aptos-core'

source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Ubuntu-x86_64.zip")
sha512sums=("4d83bcd19a8b20ee38a38e1649518e41c52fe82b45fc453cf496bf5f15e43dd2d834b55108ab45c935427c33ecf755038e6266bf8793c2166a416136d4f4a35d")

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
