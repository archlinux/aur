# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=xcursor-semi-transparent
pkgver=2016.04.15
pkgrel=1
pkgdesc="Semi-transparent Cursors Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Semi-transparent+Cursors?content=74499"
license=('GPL')
source=(
	${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1460735324/s/8b04ffe113a01ed0158fe9d6d721ab74/t/1539439984/u//74499-semi-transparent.tar.gz
)
sha256sums=(
	'112b33b255e723a1d37426446763e8ef64d896da1a64bfc2303cce550a1cde63'
)

package() {
	install -m755 -d "${pkgdir}/usr/share/icons"
	cp -R "${srcdir}/semi-transparent" "${pkgdir}/usr/share/icons/"
	chmod -R a=,a+rX,u+w "${pkgdir}/"
}
