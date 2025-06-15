# Maintainer : Gaurav Juvekar <gauravjuvekar@gmail.com>

pkgname=libreoffice-extension-apso
pkgver=1.4.5.5
pkgrel=1
pkgdesc='Alternative Python Script Organizer for OpenOffice and LibreOffice'
arch=('any')
url='https://gitlab.com/jmzambon/apso'
license=('Apache-2.0')
depends=('libreoffice')
source=("https://gitlab.com/jmzambon/apso/-/raw/v${pkgver}/apso.oxt")
noextract=("apso.oxt")
sha256sums=('fed032954ba9e3880324889c0d604ac5a82bfcb07132e0937d82f5eb95bd8864')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    bsdtar -xf "apso.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    chown -R root:root "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"/*
}
