# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=berty-gui-bin
pkgver=2.470.2
pkgrel=1
pkgdesc="GUI for a secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-gui')
conflicts=('berty-gui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/bertygui_linux_amd64.tar.gz")
b2sums=('d4ec52ebc7e24ad63923189610e9fa622755aa2bb0adff7ec5242a13f45b8558bfd852371d867cb6f0ed9577349c56fa1755f13b21f8899a87ac7fa5b856167b')

package() {
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/bertygui_linux_amd64/bertygui" "${pkgdir}/usr/bin/bertygui"
}
