# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Modern uniwidth sans font designed for user interfaces'
pkgname=ttf-pt-root-ui
pkgver=20191102
pkgrel=1
url=https://www.paratype.com/fonts/pt/pt-root-ui
arch=(any)
license=(custom:OFL)
source=('https://fontsarena.com/wp-content/uploads/2019/01/PT-Root.zip')
sha512sums=('ebbeb277050ea8f98fd0f69d4dab33b8653f9eeb151c3e845aa3004647bcffb8f2d072ae29a86edb1107d38af45c4fe98e8a0753e291575e94250a1ac5bac3c9')

package ()
{
	cd 'PT Root UI_OtTt'
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" Fonts/*/*.ttf
	install -Dm644 Documents/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
