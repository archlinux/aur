# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Anizio de Oliveira Rodrigues <aniziooliveira@bol.com.br>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=libreoffice-extension-vero
pkgver=3.2
_srcname="VeroptBRV${pkgver/./}0AOC"
pkgrel=2
pkgdesc='A spell checker and grammar checker for LibreOffice and OpenOffice.org - Brazilian Portuguese'
arch=('any')
url='https://pt-br.libreoffice.org/projetos/vero/'
license=('LGPL3' 'MPL')
depends=('libreoffice')
source=("https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/${_srcname}.oxt")
noextract=("${_srcname}.oxt")
sha256sums=('78bac9ed27bf1b23666e240bc3809b9520004f14885423580a029771032bff54')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/vero"
    
    bsdtar -xf "${_srcname}.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/vero"
}

