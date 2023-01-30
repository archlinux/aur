# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=berty-gui-bin
pkgver=2.451.0 # REMEMBER TO UPDATE CHANGELOG!
pkgrel=1
pkgdesc="GUI for a secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
changelog=changelog
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-gui')
conflicts=('berty-gui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/bertygui_linux_amd64.tar.gz")
b2sums=('fb36e8e10d143873f40834e1cca815aaf046a921f8a280ff15e64c8eae0b3fc48aa7edb58a50f21ea85d69b963984250b666083aba1f7363410abd16640766e9')

package() {
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/bertygui_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-gui-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/bertygui_linux_amd64/bertygui" "${pkgdir}/usr/bin/bertygui"
}
