# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.0.0
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('da5fc374d91843e152c8137860fd4f3558a3fd8e90dfe6f75f22b80c6fa8d4a51ab1ca3f56222e999865a3f9e71f80de1f79567bd22f7196c1105ca8ca63084f')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
