# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
__pkgname=fldigi
pkgver=4.0
pkgrel=3
pkgdesc="Documentation/help when using FLDIGI w/out i-net access"
arch=('any')
url="http://w1hkj.com/Fldigi.html"
license=('GPL')
optdepends=('fldigi' 'epdfview')
source=(https://sourceforge.net/projects/$__pkgname/files/$__pkgname/${__pkgname}_${pkgver}_help.pdf)

package() {
	cd $srcdir

	install -Dm644 ${__pkgname}_${pkgver}_help.pdf $pkgdir/usr/share/fldigi/docs/fldigi-help.pdf
}
md5sums=('72c790b7c755d1b5b91fb3020a8e4ffb')
sha256sums=('e00bdb2865cd8a4c477cfa5bc5508981a44db6e9c8d392734855e574b3a8a167')
