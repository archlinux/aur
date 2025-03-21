# Maintainer : Gaurav Juvekar <gauravjuvekar@gmail.com>

pkgname=libreoffice-extension-apso
pkgver=1.4.4
pkgrel=1
pkgdesc='Alternative Python Script Organizer for OpenOffice and LibreOffice'
arch=('any')
url='https://gitlab.com/jmzambon/apso'
license=('Apache-2.0')
depends=('libreoffice')
source=("https://gitlab.com/jmzambon/apso/-/raw/v${pkgver}/apso.oxt")
noextract=("apso.oxt")
sha256sums=('fc18aa98d7d7a8f6863d78399f8840ef89bb98f970f0396baf541d0a184eb3bd')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    bsdtar -xf "apso.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    chown -R root:root "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"/*
}
