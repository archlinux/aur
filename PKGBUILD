# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-plugin
pkgver=20.12.1
pkgrel=1
pkgdesc="VST Plugin for studiolink, a SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=()
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/vst/studio-link-plugin.zip"
    "LICENSE")
sha512sums=('39614da8628affe408b99ec7c8220ec4fbf9cbfd7981e565a6cdf81eea94873429ef1c71b07cf8fdd7f832405383688b63cca28c2dc19d7a6e4ce3cf42aca242'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link.so ${pkgdir}/usr/lib/vst/studio-link.so
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-plugin/LICENSE"
}
