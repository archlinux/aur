# Maintainer: egecelikci <egecelikci@gmail.com>
pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.14.4
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha512sums=("9838f9d37857ed31602da70ba5a0be1f5dc2b0c0fd22734790354cc27144fbe8c9d65417fc2cb8c89ac1e5a727c11c60e3cf6a4922869d5602fb94c720f8e0e3")

package() {
        cd "${pkgdir}"

        install -dm755 "usr/bin"
        install -dm755 "opt/${__pkgname}"

        cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
        ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
