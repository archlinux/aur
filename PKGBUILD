# Maintainer: dianlujitao <dianlujitao at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=ttf-cascadia-code-new
_pkgname=CascadiaCode
pkgver=2007.01
pkgrel=1
pkgdesc="A monospaced font by Microsoft that includes programming ligatures"
arch=("any")
url="https://github.com/microsoft/cascadia-code"
license=("custom:OFL")
source=(
	"https://github.com/microsoft/cascadia-code/releases/download/v$pkgver/CascadiaCode-$pkgver.zip"
	"https://raw.githubusercontent.com/microsoft/cascadia-code/master/LICENSE"
)
sha256sums=(
	'9f066d0d9cb2669bea2e130d7add43d496bf24ef995f42dc603fc2014574a3a4'
	'SKIP'
)

package() {
	cd "$srcdir"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	cd ttf
	install -Dm644 "CascadiaCodePL.ttf" "$pkgdir/usr/share/fonts/TTF/CascadiaCodePL.ttf"
	install -Dm644 "CascadiaCode.ttf" "$pkgdir/usr/share/fonts/TTF/CascadiaCode.ttf"
	install -Dm644 "CascadiaMonoPL.ttf" "$pkgdir/usr/share/fonts/TTF/CascadiaMonoPL.ttf"
	install -Dm644 "CascadiaMono.ttf" "$pkgdir/usr/share/fonts/TTF/CascadiaMono.ttf"
}
