# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.13.1
pkgrel=2
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot' 'ncspot-git')
optdepends=('ueberzug: album cover support')
source=(
	"${url}/releases/download/v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz"
	"${url}/raw/main/LICENSE"
)
sha512sums=('5e5b12628437c1c0d4a4e8f0c7f4599bbf6ee7a28d4138647a3fae4d418a8eed6c53a9e96ec0d11c0026d29878d7b59bdbaa6c1cd7f630290beecd5c684fc029'
            '5704429acf132bc3d66071eb9d5b3ba82e3cc960fb691a786fe8c0ce1526e4fb4a1ce36059501c9c37eca8d47ba67dfd0d0d4c673f7dfbb15f486a93a2c91bdf')

package() {
	cd "$srcdir"

    install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 755 LICENSE 		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
