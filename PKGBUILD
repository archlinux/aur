# Maintaner: André Vitor de Lima Matos <andre.vmatos@gmail.com>

pkgname=libreoffice-extension-cogroo
_pkgname=cogroo
pkgver=4.0.0
pkgrel=2
pkgdesc="CoGrOO (A LibreOffice & OpenOffice.org Grammar Checker), the only open source Portuguese grammar checker that can be used with LibreOffice & OpenOffice.org."
arch=('any')
url="http://cogroo.sourceforge.net/"
license=('Apache')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
source=("http://sourceforge.net/projects/${_pkgname}/files/${_pkgname}${pkgver%%.*}/${pkgver}/${_pkgname}-${pkgver}.oxt")
sha1sums=('e29cbb48ec458b73eb06b06885cd85d33ce086a9')

package () {
    install -d "${pkgdir}/usr/lib/libreoffice/share/extensions/"
    cp -R "${srcdir}" "${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}"
    rm -R "${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/${_pkgname}-${pkgver}.oxt"
}

