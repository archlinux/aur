# $Id$
# Maintainer: Romanos Skiadas <rom.skiad@gmail.com>
# Contributor: Glorfindel <glorfindel@sent.com>

pkgname=otf-latinmodern-math
pkgver=1.959
_pkgver=1959
pkgrel=1
url='http://www.gust.org.pl/projects/e-foundry/lm-math'
pkgdesc='The Latin Modern Math (LM Math) font'
license=('custom:GUST Font License')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-${_pkgver}.zip")
md5sums=('bc82f6d4184ec0ea3ba2c0798e6be719')
install=otf.install

package() {
	cd "${srcdir}"/latinmodern-math-${_pkgver}/otf/
	install -dm755 "${pkgdir}"/usr/share/fonts/OTF
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF
}


