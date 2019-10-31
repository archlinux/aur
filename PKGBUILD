# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
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
source=("http://yudit.org/download/fonts/UBraille/UBraille.ttf")
sha256sums=('4bdec13f35920a29cfe729946018e6c1695a8074a91882a62244e428f3ffe122')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
