# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.7
pkgrel=2
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot' 'ncspot-git')
source=("https://github.com/hapakaien/aur-packages/releases/download/ncspot%40v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz" "${url}/raw/main/LICENSE")
sha512sums=('67a9f77d936da6cc8f2c118cc44067bdc124cf1eff5ba85c41f4912167a1154225ba62c8afe68ceb7a348184882095c96aead6bec43249829a15f832c33361cb' 'SKIP')

package() {
	cd "$srcdir"

    install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 755 LICENSE 		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
