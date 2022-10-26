# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=berty-gui-bin
pkgver=2.434.8
pkgrel=1
pkgdesc="GUI for a secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
changelog=changelog.md
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-gui')
conflicts=('berty-gui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/bertygui_linux_amd64.tar.gz")
b2sums=('137a79ff2df5cc5bb838a83b4b481ef6be07e1081d9ed2ed1e8d303ef634cf4f8ebf5fb1488f545bb5ccc8e7acd639e30fa87443bcabaacd389ae7c24bcc5d71')

package() {
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/bertygui_linux_amd64/bertygui" "${pkgdir}/usr/bin/bertygui"
}
