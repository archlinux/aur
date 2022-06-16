# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.0.2
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('d7c6166178864ef68327cf78ff2b7805a51aa1e2552c020c4eb83decfda069e6f687c6a9fd0305526e9d084c7f0e1eb75b5d942182fe779fb6b9015c3ce0ed74')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
