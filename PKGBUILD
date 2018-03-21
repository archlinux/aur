# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='hosts'
pkgver=2.4.1
pkgrel=1
pkgdesc='A command line tool for managing hosts file entries.'
arch=('x86_64')
url=https://github.com/alphabetum/"${pkgname}"
license=('MIT')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/alphabetum/"${pkgname}"/archive/"${pkgver}".tar.gz)
sha256sums=('fa26724312e9d54ece98c4250b34d3696f1b2139bd826580e9f1773159f8a1ac')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  # TODO: Need to package autocompletions
  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
