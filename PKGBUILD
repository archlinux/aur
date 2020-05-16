# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=netease-music-tui-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="netease cloud music terminal client by rust"
arch=('x86_64')
url="https://github.com/betta-cyber/netease-music-tui"
license=('MIT')
provides=('netease-music-tui')
conflicts=('netease-music-tui')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/betta-cyber/${pkgname}/releases/download/v${pkgver}/${pkgname}-linux.tar.gz"
		LICENSE::"https://raw.githubusercontent.com/betta-cyber/netease-music-tui/master/LICENSE")
sha256sums=('18ff28f9c8803b6a9e8b86f30712c9fde0a61a1e55b1135f55eac2a9a6a598d3'
            '9dfa9048ff73b894cb84a4209f47c40371a3c4824108ce8deb2f18736aec9bd7')
package() {
	install -Dm755 ncmt ${pkgdir}/usr/bin/ncmt
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
