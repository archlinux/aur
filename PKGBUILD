# Maintainer: Kit Calico Mystle <kit@roxi.is-a.dev>

pkgname=ttc-calicosevka
pkgver=1.0.0
pkgrel=2
pkgdesc='An Iosevka-based font created by a calico cat lover'
arch=('any')
url='https://codeberg.org/Kit_CMystle/ttc-calicosevka'
license=('OFL-1.1')
source=(
	"https://codeberg.org/Kit_CMystle/ttc-calicosevka/releases/download/v$pkgver/Calicosevka.ttc"
	"https://codeberg.org/Kit_CMystle/ttc-calicosevka/releases/download/v$pkgver/Calicosevka.ttc.asc"
	"https://codeberg.org/Kit_CMystle/ttc-calicosevka/releases/download/v$pkgver/LICENSE.md"
	"https://codeberg.org/Kit_CMystle/ttc-calicosevka/releases/download/v$pkgver/LICENSE.md.asc"
)
sha256sums=('3397c0ba05411fe88674895f3a526e37993dd7beaf60bc4fec3a94059bf910d2'
            'SKIP'
            '4ba53c7c1cb39279aae5f8d7d22054c485c71169920e5a36ed098b115e2e3c5d'
            'SKIP')
validpgpkeys=('30E975B34C2A2FF155524EF461DA6BEEBCF75BC2')

package() {
	install -Dm644 Calicosevka.ttc "$pkgdir/usr/share/fonts/TTC/Calicosevka.ttc"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
