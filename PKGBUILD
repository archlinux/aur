# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>

_pkgname=pdf2htmlEX

pkgname=pdf2htmlex-appimage
pkgver=0.18.8.rc1
pkgrel=1
epoch=
pkgdesc="Convert PDF to HTML without losing text or format."
arch=('x86_64')
url="https://github.com/pdf2htmlEX/pdf2htmlEX"
license=('GPL3')
provides=('pdf2htmlex')
conflicts=('pdf2htmlex')
depends=('zlib')
options=(!strip)
_filename='pdf2htmlEX-0.18.8.rc1-master-20200630-Ubuntu-focal-x86_64.AppImage'
install=
changelog=
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('11de2583a3abce5f141fd7fafb1fea2c67b15886e546d6b7675c600012e6ab8c')

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
