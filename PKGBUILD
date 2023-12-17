pkgname=clash-meta-is-mihomo
url="https://aur.archlinux.org/packages/clash-meta"
pkgver=1
pkgrel=1
makedepends=()
pkgdesc="Another Clash Kernel by MetaCubeX"
arch=('any')
license=('GPL3')
depends=("clash-meta")
provides=('mihomo')
conflicts=('mihomo')

function package(){
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /usr/bin/clash-meta "${pkgdir}/usr/bin/mihomo"
}
