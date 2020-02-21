# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-ubraille
pkgver=001.000
pkgrel=10
pkgdesc='Unicode Braillt font'
url='http://yudit.org/download/fonts/UBraille/'
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://yudit.org/download/fonts/UBraille/UBraille.ttf')
sha512sums=('bef05539744f51d78c17ba8655aeac8e84b49a209192c3e8c197159c4666052c9dfcb0116c1356a37ca04606af14ab6a972a7989ecb87b3b3146c608872a7206')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
