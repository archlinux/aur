# Maintainer: egecelikci <egecelikci@gmail.com>
pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.14.5
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha512sums=("4f4085c3c3e7caa3e7ad62811fae2a2178d47d2e443b9bcf13d2d0b651692deeadf3bf3735a1d2383bd0a45e0f6192d116bb108a22619313ba5bf677d43532a2")

package() {
        cd "${pkgdir}"

        install -dm755 "usr/bin"
        install -dm755 "opt/${__pkgname}"

        cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
        ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
