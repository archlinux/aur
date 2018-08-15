# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=xcursor-semi-transparent
pkgver=2016.04.15
pkgrel=1
pkgdesc="Semi-transparent Cursors Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Semi-transparent+Cursors?content=74499"
license=('GPL')
source=(
	${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1460735324/s/f17afbca0dfe02e22862ae8472a15885/t/1534328613/u//74499-semi-transparent.tar.gz
)
sha256sums=(
	'112b33b255e723a1d37426446763e8ef64d896da1a64bfc2303cce550a1cde63'
)

package() {
	install -m755 -d "${pkgdir}/usr/share/icons"
	cp -R "${srcdir}/semi-transparent" "${pkgdir}/usr/share/icons/"
	chmod -R a=,a+rX,u+w "${pkgdir}/"
}
