# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.8
pkgrel=2
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot' 'ncspot-git')
optdepends=('ueberzug: album cover support')
source=("https://github.com/hapakaien/aur-packages/releases/download/ncspot%40v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz" "${url}/raw/main/LICENSE")
sha512sums=('ecc8e3d36d95ce6c5563e88a7a272c2570cbec7e03e587f91f9f4bed94af11c48ad2672095e634cf1682a5cc9fc0b35e625a5bb0b22ed5518c450a02c0130bef'
            '5704429acf132bc3d66071eb9d5b3ba82e3cc960fb691a786fe8c0ce1526e4fb4a1ce36059501c9c37eca8d47ba67dfd0d0d4c673f7dfbb15f486a93a2c91bdf')

package() {
	cd "$srcdir"

    install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 755 LICENSE 		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
