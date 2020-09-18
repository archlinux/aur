# Maintainer: Tobias Borgert <mail@tobias-borgert.de>:

pkgname=fortune-mod-mechanicus
pkgver=20200720
pkgrel=1
pkgdesc="Fortune cookies: Warhammer 40,000 - Mechanicus (game)."
arch=('any')
license=('unknown')
depends=(fortune-mod)
url="https://www.reddit.com/r/40kLore/comments/asq4rj/collected_quotes_aphorisms_and_psalms_from_the/"

source=('mechanicus')
sha256sums=('e3da67adc5f32bbc55b2b78efa57c050801d53dbdfc58995bec1f2cf57a7d5e1')

build() {
	strfile "${srcdir}"/mechanicus "${srcdir}"/mechanicus.dat
}

package() {
	  install -D -m644 "${srcdir}"/mechanicus "${pkgdir}"/usr/share/fortune/mechanicus
	  install -D -m644 "${srcdir}"/mechanicus.dat "${pkgdir}"/usr/share/fortune/mechanicus.dat
}
