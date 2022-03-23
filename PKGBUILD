# Maintainer : Gaurav Juvekar <gauravjuvekar@gmail.com>

pkgname=libreoffice-extension-apso
pkgver=1.3.0
pkgrel=1
pkgdesc='Alternative Python Script Organizer for OpenOffice and LibreOffice'
arch=('any')
url='https://gitlab.com/jmzambon/apso'
license=('APACHE')
depends=('libreoffice')
source=("https://gitlab.com/jmzambon/apso/-/raw/v${pkgver}/apso.oxt")
noextract=("apso.oxt")
sha256sums=('4f5573a2507dbe62089959ce550a70e3c0b7bb5367c8207947672c70d6e84fb5')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    bsdtar -xf "apso.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"
    chown -R root:root "${pkgdir}/usr/lib/libreoffice/share/extensions/apso"/*
}
