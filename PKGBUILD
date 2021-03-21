# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-plugin
pkgver=21.03.2
pkgrel=1
pkgdesc="VST Plugin for studiolink, a SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=()
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/vst/studio-link-plugin.zip"
    "LICENSE")
sha512sums=('bde7891d6216598f9def057c49efef4c6479abd244762451a4376e8c94fe4ee5113c2ec86641d361f571e7ea0082a1f67d8105bc1085a21dbb18c9bdc640d44b'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link.so ${pkgdir}/usr/lib/vst/studio-link.so
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-plugin/LICENSE"
}
