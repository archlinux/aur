# Maintainer: egecelikci <egecelikci@gmail.com>
pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.14.2
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha512sums=("a6d661a748d5a425f50538069e119b02d0a6bd88526ef55d26651bab7b5e3c98fbc8053b7c47410e38c07d72aa514084ca3d5d2f456b60f7e61e3036e0ed4a60")

package() {
        cd "${pkgdir}"

        install -dm755 "usr/bin"
        install -dm755 "opt/${__pkgname}"

        cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
        ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
