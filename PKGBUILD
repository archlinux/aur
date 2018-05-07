# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=graphpath
pkgver=1.0
pkgrel=2
pkgdesc='Graphpath generates an ASCII network diagram from the route table of a Unix/Linux router'
arch=('any')
url=https://github.com/ocochard/"${pkgname}"
license=('BSD')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/ocochard/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('9e018bbb44f748595d4eb030896ccc195a9a75db773160da480743f31b5b8272')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
