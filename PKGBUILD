# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='hosts'
pkgver=3.1.0
pkgrel=1
pkgdesc='A command line tool for managing hosts file entries.'
arch=('x86_64')
url=https://github.com/alphabetum/"${pkgname}"
license=('MIT')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/alphabetum/"${pkgname}"/archive/"${pkgver}".tar.gz)
sha256sums=('01b5671313ef21dbaf58828257be2f217d4e8bf08c989f07a12f01a2757971bc')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  # TODO: Need to package autocompletions
  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
