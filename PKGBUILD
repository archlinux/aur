# Maintainer: M Novick <mnovick1988@gmail.com>
# Maintainer: M Rawash <mrawash@gmail.com>
# Contributor: MrBougo <bougospam at gmail dot com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>

pkgname=xonotic-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="shortcuts for Xonotic(glx,sdl,dedicated)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'armv8h')
url="http://xonotic.org"
license=('GPL')
depends=('xonotic' 'xonotic-icons')
conflicts=('xonotic-desktop')

source=('xonotic-dedicated.desktop'
'xonotic-glx.desktop'
'xonotic-sdl.desktop'
)
md5sums=('3c9c1a7583ccade9025adca0d16cf88c'
         '9b1cb355a24ccca159499cca49c432dc'
         'd720d62419e7faf080d17217582cfbf1')



package() {
	msg "Building Package..."
	mkdir -p "$pkgdir"/usr/share/applications
	install -m755 xonotic-glx.desktop "$pkgdir"/usr/share/applications
	install -m755 xonotic-sdl.desktop "$pkgdir"/usr/share/applications
	install -m755 xonotic-dedicated.desktop "$pkgdir"/usr/share/applications
}
