# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=otf-texgyre-pagella-math
pkgver=1.632
pkgrel=1
pkgdesc='Math companion for the TeX Gyre Pagella family'
arch=('any')
url='http://www.gust.org.pl/projects/e-foundry/tg-math'
license=('custom:GUST Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("$url/download/texgyrepagella-math-${pkgver//.}.zip")
md5sums=('4cec48f51c2520397fc6161aad566545')

package () {
	cd "$srcdir/texgyrepagella-math-${pkgver//.}"
	install -Dm644 "doc/GUST-FONT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/GUST-FONT-LICENSE.txt"
	install -Dm644 "opentype/texgyrepagella-math.otf" "$pkgdir/usr/share/fonts/OTF/texgyrepagella-math.otf"
}

