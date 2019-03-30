# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>

pkgname='behdad-fonts'
pkgver=0.0.3
pkgrel=1
pkgdesc='Behdad is a Persian/Arabic font. This font is a gift to Behdad Esfahbod'
url='https://github.com/font-store/BehdadFont'
arch=(any)
license=('OFL-1.1')
depends=('fontconfig')
provides=('ttf-behdad')
conflicts=('ttf-behdad')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Behdad-${pkgver}.zip")
sha512sums=('74f184c2a406f29f667c2018746a095f19be8888ae48fe349b5efd007844268fb5e79db57509a8067630df7b5767faa135f8112fe0db11dab68a42c7cdbca678')

package() {
    install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./*.ttf
}
