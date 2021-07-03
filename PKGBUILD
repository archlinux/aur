# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-plugin
pkgver=21.05.0
pkgrel=1
pkgdesc="VST Plugin for studiolink, a SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=()
source=("https://download.studio.link/releases/v${pkgver}-stable/linux/vst/studio-link-plugin.zip"
    "LICENSE")
sha512sums=('0deed1ea8caed9e2e7ad665d3be61bb63fa36a08e95ea6a41323c3f123796da58471933a507d0c438e69c36343a04753b3cb04e249158f5528bced5c1ed2e140'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package()
{
    install -Dm755 ${srcdir}/studio-link.so ${pkgdir}/usr/lib/vst/studio-link.so
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-plugin/LICENSE"
}
