# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='hosts'
pkgver=3.5.1
pkgrel=1
pkgdesc='A command line tool for managing hosts file entries.'
arch=('x86_64')
url=https://github.com/alphabetum/"${pkgname}"
license=('MIT')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/alphabetum/"${pkgname}"/archive/"${pkgver}".tar.gz)
sha256sums=('7d68bf2e717be95d945bca56fca6a52c85b74e4e122e93a8b0d6eb849a748344')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  # TODO: Need to package autocompletions
  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
