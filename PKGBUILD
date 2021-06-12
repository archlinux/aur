# Maintainer: egecelikci <egecelikci@gmail.com>
pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.14.3
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=("https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz")
sha512sums=("5da2b590a3d81e129972ef49bfe91fc9c20b339bc427e786eaec6f3cd14ceb3c98753a6aaff6e1890648aca778adb54781f17932f61e2988cc036c918effce1f")

package() {
        cd "${pkgdir}"

        install -dm755 "usr/bin"
        install -dm755 "opt/${__pkgname}"

        cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
        ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
}
