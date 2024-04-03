# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-hanken
pkgver=1.0
pkgrel=3
pkgdesc='Geometric and rounded sans-serif font'
arch=(any)
url="https://github.com/marcologous/hanken-grotesk"
license=(OFL-1.1-no-RFN)
source=("git+$url#commit=1ab416e82130b2d3ddb7710abf7ceabf07156a13")
sha256sums=('29c0e4ef41c1dbcb9f9b90e98833d4db9c27e472e3b52a866e9a98574892efa7')

package() {
	cd hanken-grotesk
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" fonts/ttf/*.ttf
}
