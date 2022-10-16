# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.1.1
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('66254894bfacd71e691a540453820c7265e2e425686c2a273695782748466cc07611decd2cec41d4187ef84106820f770338596a195771a4df243eac014a77c5')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
