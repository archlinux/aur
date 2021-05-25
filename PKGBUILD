# Maintainer: egecelikci <egecelikci@gmail.com>
pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.14.1
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha512sums=("4caac43cc01519c1e70b1ca236a3f315a6a581ded5d2d8e5317f2599f7e2cf337c136a5929307e56f76ef478647f26a7f05bfc4cad0ae240f8c445cbdab6038b")

package() {
        cd "${pkgdir}"

        install -dm755 "usr/bin"
        install -dm755 "opt/${__pkgname}"

        cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
        ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
