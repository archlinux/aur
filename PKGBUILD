# Maintainer: personinblack <berkay@tuta.io>

pkgname=otb-eldur
pkgver=0.0.5
pkgrel=1
pkgdesc="An eccentric bitmap microfont for all your spellcasting needs."
arch=("any")
url="https://github.com/molarmanful/eldur"
license=("OFL")
source=(
	"https://github.com/molarmanful/eldur/releases/download/v${pkgver}/eldur.otb"
	"https://github.com/molarmanful/eldur/releases/download/v${pkgver}/eldur2x.otb"
	"https://github.com/molarmanful/eldur/releases/download/v${pkgver}/LICENSE"
)
sha256sums=('3863fa264b5d1798fd9c487c4105aeb60dd2821759b81ab78c6e0f330af2a262'
            'c60a098aa84044adb48450bf4dd6b03204259a19cc12cb0e9dde758000427c34'
            'd8bbef4a74a4b2dc264194ed08ddbdd942298b79ae855ef1f60bf69d966a7d2e')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/misc" "$srcdir/eldur.otb"
	install -Dm644 -t "$pkgdir/usr/share/fonts/misc" "$srcdir/eldur2x.otb"
	install -Dm644 -t "$pkgdir/usr/share/licenses/eldur" "$srcdir/LICENSE"
}
