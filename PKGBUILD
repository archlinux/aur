# Maintainer: FadeMind <fademind@gmail.com>

pkgname="libreoffice-fresh-kalahari"
pkgver=0.4.2
pkgrel=1
pkgdesc="Faenza like icon theme for LibreOffice 4.4.x series"
arch=('any')
url="https://github.com/FadeMind/${pkgname}"
license=('MPL2')
depends=('libreoffice-fresh-rpm')
source=("images_faenza.zip::${url}/raw/master/images_faenza.zip"
        "images_faenza_dark.zip::${url}/raw/master/images_faenza_dark.zip"
        "LICENSE::https://www.mozilla.org/MPL/2.0/index.txt")
noextract=('images_faenza.zip' 'images_faenza_dark.zip')
sha256sums=('7ded91512511ed104ac9562894fbdc8b33a6b3bd230759045de1eee0fe4f598d'
            '6d53c894683213cd555686c013695ade334afa10146edc1823ef235289055d0e'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
install -D -m644 ${srcdir}/images_faenza.zip ${pkgdir}/opt/libreoffice4.4/share/config/images_faenza.zip
install -D -m644 ${srcdir}/images_faenza_dark.zip ${pkgdir}/opt/libreoffice4.4/share/config/images_faenza_dark.zip
install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
