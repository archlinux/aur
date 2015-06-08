# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=otf-texgyre-pagella-math
pkgver=1.605
pkgrel=1
pkgdesc='Math companion for the TeX Gyre Pagella family'
arch=('any')
url='http://www.gust.org.pl/projects/e-foundry/tg-math'
license=('custom:GUST Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(
	"$url/download/texgyrepagella-math-${pkgver//.}.zip"
	"http://www.gust.org.pl/projects/e-foundry/licenses/GUST-FONT-LICENSE.txt"
)
install="$pkgname.install"
md5sums=('48f1b1074f03edf0d5374cec85b96223'
         '7ab98aedba83bca3de4a3ca3792e7390')

package () {
	cd "$srcdir"
	install -Dm644 "GUST-FONT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/GUST-FONT-LICENSE.txt"
	install -Dm644 "texgyrepagella-math-${pkgver//.}/otf/texgyrepagella-math.otf" "$pkgdir/usr/share/fonts/OTF/texgyrepagella-math.otf"
}

