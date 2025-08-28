# Maintainer: Eri the Switch <e2024@opayq.com>

pkgname="ttf-openttd"
pkgver=0.8
pkgrel=1
pkgdesc="OpenTTD TrueType typefaces"
url='https://github.com/zephyris/openttd-ttf'
arch=(any)
license=('GPL-2.0-only')
source=("OpenTTD-Mono-${pkgver}.ttf::https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Mono.ttf"
        "OpenTTD-Sans-${pkgver}.ttf::https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Sans.ttf"
        "OpenTTD-Serif-${pkgver}.ttf::https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Serif.ttf"
        "OpenTTD-Small-${pkgver}.ttf::https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Small.ttf"
        "OpenTTD-SmallCaps-${pkgver}.ttf::https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-SmallCaps.ttf")
sha256sums=('7ec9e91093167e140193633cff861c3f7a3ce5a36f9fcaa24e02366ee13f66b0'
            'f10d200b4769e31302d949326f0cd3a3f697a34788892f7180d813600693afe2'
            'c299f2d912a4f78a85f2633adad11450a1186b8f63d5adc0999fdc3a4a536266'
            'cfbd78b80bfecff188eae4c23447073e781c60741d39d16af2ca81a3920cbb5f'
            '1f8c8e1adb62f43fdc7bcefad37cfe8c852c6774e8612eec1ac19b0aecacdaf8')

package() {
    for font in Mono Sans Serif Small SmallCaps
    do
        install -Dm644 -T "OpenTTD-${font}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/OpenTTD-${font}.ttf"
    done
}
