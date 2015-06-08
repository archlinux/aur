# $Id$
# Maintainer: Glorfindel <glorfindel@sent.com>

pkgname=otf-latinmodern-math
pkgver=1.958
_pkgver=1958
pkgrel=3
url='http://www.gust.org.pl/projects/e-foundry/lm-math'
pkgdesc='The Latin Modern Math (LM Math) font'
license=('custom:GUST Font License')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-${_pkgver}.zip")
md5sums=('52c43bfc5d820e8b6e3398d0cf290380')

install=otf.install

package() {
	cd "${srcdir}"/latinmodern-math-${_pkgver}/otf/
	install -dm755 "${pkgdir}"/usr/share/fonts/OTF
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF
}


