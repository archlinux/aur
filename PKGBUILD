# Maintainer: Rvn0xsy <rvn0xsy@gmail.com>
# Contributor: Rvn0xsy <rvn0xsy@gmail.com>
pkgname="aptos-bin"
_pkgname="${pkgname%-bin}"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="The aptos tool is a command line interface (CLI) for debugging, development, and node operations."
arch=("x86_64")
license=("Apache")
url='https://github.com/aptos-labs/aptos-core'

source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Ubuntu-x86_64.zip")
sha512sums=("5102fad1fd3b34b8530557f9b254b7726f06dea592f0c4fc0ce3bcb67d894644d15c7316b865fad37a6899692a1b0370560781a6c32e0929deabdc709335f4bb")

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
