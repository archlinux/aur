# Maintainer : Gaurav Juvekar <gauravjuvekar@gmail.com>

pkgname=libreoffice-extension-apso
pkgver=1.4.2.7
pkgrel=1
pkgdesc='Alternative Python Script Organizer for OpenOffice and LibreOffice'
arch=('any')
url='https://gitlab.com/jmzambon/apso'
license=('Apache-2.0')
depends=('libreoffice')
source=("https://gitlab.com/jmzambon/apso/-/raw/v${pkgver}/apso.oxt")
noextract=("apso.oxt")
sha256sums=('5ac3979aac0d9a85f891eba9a4b6d9c808996fa7d57c4770ce6f62519c5be7f5')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    bsdtar -xf "apso.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    chown -R root:root "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"/*
}
