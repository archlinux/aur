# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-plugin
pkgver=21.07.0
pkgrel=1
pkgdesc="VST Plugin for studiolink, a SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=()
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/vst/studio-link-plugin.zip"
    "LICENSE")
sha512sums=('c5606f6cc571e23d6a5fd1f070cdc0c316f62339b16bb0a288dffb68d564c0827fec4e163f29646f7c2bdfe906aa2b5a9cc2546ba268bea1816fd930fd2a2ea4'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link.so ${pkgdir}/usr/lib/vst/studio-link.so
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-plugin/LICENSE"
}
