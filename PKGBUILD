# Maintainer: Eri the Switch <e2024@opayq.com>

pkgname="ttf-openttd"
pkgver=0.6
pkgrel=1
pkgdesc="OpenTTD TrueType typefaces"
url='https://github.com/zephyris/openttd-ttf'
arch=(any)
license=('GPL-2.0-only')
source=("https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Mono.ttf"
        "https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Sans.ttf"
        "https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Serif.ttf"
        "https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-Small.ttf"
        "https://github.com/zephyris/openttd-ttf/releases/download/${pkgver}/OpenTTD-SmallCaps.ttf")
sha256sums=('71d08887a117f96eea08b39467eeae5ea6ea2e897b955f79de5e05485e0c0405'
            '61b4fd45d9693f175667a1f366d3b7c5c90edd079227fb5072b33c54d8def17b'
            '05f26a3e563846eafb908d5c8f05d350449a001bf96bab912fa77c97863e4704'
            'a66353b153520f1a45bc6ce9738fd4cad7f0a50c2cefec12b5293885932f850a'
            'e7df00771fd6e0b9dd35d406b7a40fbf1f193722248cafae16684d3bc8fd0b5a')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Mono.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Sans.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Serif.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Small.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-SmallCaps.ttf"
}
