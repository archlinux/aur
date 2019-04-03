# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-ubraille
pkgver=001.000
pkgrel=9
pkgdesc='Unicode Braillt font'
url='http://yudit.org/download/fonts/UBraille/'
arch=('any')
license=('GPL')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
source=("http://yudit.org/download/fonts/UBraille/UBraille.ttf")
sha256sums=('4bdec13f35920a29cfe729946018e6c1695a8074a91882a62244e428f3ffe122')

install=install

package() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/share/fonts/TTF
	install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
