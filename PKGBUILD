# Maintainer: @RubenKelevra

pkgname=berty-gui-bin
pkgver=2.388.2
pkgrel=1
pkgdesc="GUI for a secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd' 'berty')
provides=('berty-gui')
conflicts=('berty-gui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/bertygui_linux_amd64.tar.gz")
b2sums=('40a0009c41bc6799177cb27b1ac03c7da68f697a3d722487ac18f538ee63eac48995c79a0f4e8b41d2dcf3e952bd2e470b2aa3161c58fd4f2ef999ac7b42191d')

package() {
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/bertygui_linux_amd64/bertygui" "${pkgdir}/usr/bin/bertygui"
}
