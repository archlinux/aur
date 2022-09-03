# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.0.5
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('3f3056e4b6885fe96b5aac6f7469aa254ba1bb1cc1752a9f5f7e69fd00fee3d7c24aefb391db95a8b3a2fdf0cb78ee0453cd9d68e913d89f00c072a840d7667f')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
