# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-onair-plugin
pkgver=21.07.0
pkgrel=1
pkgdesc="LV2 Plugin for studiolink's on-air service"
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('openssl' 'zlib')
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/studio-link-plugin-onair.zip"
        "LICENSE")
sha512sums=('3c32747da640f90840da12b12c14bd269f4da1963938116adbefc69c2488afbfb0c0315bd09fc3bc56ce034d4e36f3770dd5b659f98e5a4cea2d339382db265a'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link-onair.lv2/studio-link-onair.so ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/studio-link-onair.so
    install -Dm644 ${srcdir}/studio-link-onair.lv2/studio-link-onair.ttl ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/studio-link-onair.ttl
    install -Dm644 ${srcdir}/studio-link-onair.lv2/manifest.ttl ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/manifest.ttl
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-onair-plugin/LICENSE"
}
