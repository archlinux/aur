# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=ttf-teletext2
pkgver=1.0
_gitver=b2df8095dee3bec5f0a5cf9a363b364512ed3df9
pkgrel=1
pkgdesc="TrueType font for renderng special graphic characters used in Teletext"
arch=('any')
license=('GPL2')
url="https://projects.vdr-developer.org/projects/plg-osdteletext"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("${url}/repository/revisions/${_gitver}/entry/teletext2.ttf")
md5sums=('ddc338f8165f93d7b7ee722f59ec8be0')

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/TTF
	install -m644 ${srcdir}/teletext2.ttf ${pkgdir}/usr/share/fonts/TTF/
}
