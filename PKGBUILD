# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: egecelikci <egecelikci@gmail.com>

pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.15.0
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha256sums=("9b90a2324ed90fc9fe849c188a5755fc517826584e61afcd0b016e77992573e6")

package() {
  cd "${pkgdir}"

  install -dm755 "usr/bin"
  install -dm755 "opt/${__pkgname}"

  cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
  ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
