# Maintainer: Zack Grannan <zgrannan at gmail dot com>

pkgname=ttf-lklug
pkgver=1
pkgrel=4
pkgdesc="Unicode sinhala font"
arch=('any')
url="http://sinhala.sourceforge.net/"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://sinhala.sourceforge.net/files/lklug.ttf)
md5sums=('3bfe4e498d6daa90a4ed956daaa10fef')

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp "${srcdir}/lklug.ttf" "${pkgdir}/usr/share/fonts/TTF/lklug.ttf"
}
