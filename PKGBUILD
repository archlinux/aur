# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.0.3
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('9e00a6e25630c312c265c2b72115badf19271a76c53896e912b370485c6a95b51dee0fa61668f9b108fe48ad85c2817df36ef73516e2c834e04c97366b213958')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
