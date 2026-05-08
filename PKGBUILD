# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=woff2-excalifont
pkgdesc="hand-drawn / handwritten font by Excalidraw (sans-serif)"
pkgver=2024
pkgrel=1
arch=(any)
license=(OFL-1.1-no-RFN)
url="https://plus.excalidraw.com/excalifont"

source=(
	'https://excalidraw.nyc3.cdn.digitaloceanspaces.com/fonts/Excalifont-Regular.woff2'
	'LICENSE'
)
sha256sums=(
	'ee41ec4c06bfa0728665499de6f4b4019e7953119ab20b5aeb5917f1609c3b2a'
	'8c1107d42f73ddb4f824694ce5491f55a1b70ce64ace2de0269613cbf1dcccde'
)

package() {
	install -m 644 -Dt "$pkgdir/usr/share/fonts/WOFF2/"       "Excalifont-Regular.woff2"
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
