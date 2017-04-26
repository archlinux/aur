# Maintainer: ava1ar (mail(at)ava1ar(dot)me)

pkgname=iceglass-icons
_realname=Iceglass
pkgver=4.12
pkgrel=1
pkgdesc="Iconset for dark color schemes"
arch=('any')
url="http://kde-look.org/content/show.php/Iceglass?content=121145"
license=('GPL')
options=(!strip)
source=("${_realname}-${pkgver}.tar.xz::https://www.dropbox.com/s/go4e6z694q1ofzq/${_realname}-${pkgver}.tar.xz?dl=1")
sha1sums=('09363cd8b6015d377a7f1b3bd4d0b46a76c4ea79')

package() {
	cd ${srcdir}/${_realname}-${pkgver}
	mkdir -p ${pkgdir}/usr/share/icons/${_realname}
	cp -r * ${pkgdir}/usr/share/icons/${_realname}
	find "${pkgdir}" -type f  -perm 750 -exec chmod 644 {} \;
}
