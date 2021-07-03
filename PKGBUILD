# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-onair-plugin
pkgver=21.05.0
pkgrel=1
pkgdesc="LV2 Plugin for studiolink's on-air service"
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('openssl' 'zlib')
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/studio-link-plugin-onair.zip"
        "LICENSE")
sha512sums=('cfdab052356f4757d2bd873d112e21fc3d2638df3b2ce4140e207e11e65dc6b493db0e094479e3c72d93c218bfe37e2d725164435d42601d9b380fd054601411'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link-onair.lv2/studio-link-onair.so ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/studio-link-onair.so
    install -Dm644 ${srcdir}/studio-link-onair.lv2/studio-link-onair.ttl ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/studio-link-onair.ttl
    install -Dm644 ${srcdir}/studio-link-onair.lv2/manifest.ttl ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2/manifest.ttl
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-onair-plugin/LICENSE"
}
