# Maintainer: Eri the Switch <e2024@opayq.com>

pkgname="ttf-openttd"
pkgver=0.7
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
            'b6fb3123beb28a5840aa8245f8a9d348e0520100dc9ea2f90e10a291c1fb87b9'
            '05f26a3e563846eafb908d5c8f05d350449a001bf96bab912fa77c97863e4704'
            '995d739adbe9b18cbaa9d63e9d5008c47c445635ff5a2258261b51b028a3ac09'
            '9e7c418c89838843d9f6d3fa0aa25a82b83d86f21ae31e2cfb39e15847cac863')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Mono.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Sans.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Serif.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-Small.ttf"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "OpenTTD-SmallCaps.ttf"
}
