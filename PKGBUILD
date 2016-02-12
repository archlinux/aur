# Maintainer: FadeMind <fademind@gmail.com>

pkgname="libreoffice-fresh-kalahari"
pkgver=0.4.6
pkgrel=2
_lover=5.1
pkgdesc="Kalahari icon themes for libreoffice-fresh-rpm"
arch=('any')
url="https://github.com/FadeMind/${pkgname}"
license=('custom:MPL2')
depends=('libreoffice-fresh-rpm')
source=("images_faenza.zip::${url}/raw/master/images_faenza.zip"
        "images_faenza_dark.zip::${url}/raw/master/images_faenza_dark.zip"
        "images_elementary.zip::${url}/raw/master/images_elementary.zip"
        "images_kalahari.zip::${url}/raw/master/images_kalahari.zip"
        "images_manjaro.zip::${url}/raw/master/images_manjaro.zip"
        "LICENSE::https://www.mozilla.org/MPL/2.0/index.txt")
noextract=(images_{faenza{,_dark},elementary,kalahari,manjaro}.zip)
sha256sums=('7ded91512511ed104ac9562894fbdc8b33a6b3bd230759045de1eee0fe4f598d'
            '6d53c894683213cd555686c013695ade334afa10146edc1823ef235289055d0e'
            'b748091574e2d1f4fc3fe8322831b09e75a53a5f04a3b82a888f954a2395dc7c'
            'eaf8f8e5a5c29035e46db22c655cb66e2d268f74a57e09a717b534bf4294f278'
            'e331ad9de44885069d93121cf97d8782eee98ccbbaa36d0e0625ead8dd84efd3'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  install -Dm644 -t "${pkgdir}/opt/libreoffice${_lover}/share/config/"  ${srcdir}/*.zip
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"   ${srcdir}/LICENSE
}