# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=berty-gui-bin
pkgver=2.434.7
pkgrel=1
pkgdesc="GUI for a secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-gui')
conflicts=('berty-gui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/bertygui_linux_amd64.tar.gz")
b2sums=('43906d7539bc5f803544eccf8cc0a12ecc736184c8392cf4c1d741d02d5977ef8e21e3be9b617745a8696ee5aaebfaa2e2b6e5e0fe693648bd3bfdbf136eb8c9')

package() {
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/bertygui_linux_amd64/bertygui" "${pkgdir}/usr/bin/bertygui"
}
