# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
__pkgname=fldigi
pkgver=4.0
pkgrel=1
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
md5sums=('8bdc51ae9ef4f47b65cfa40667ba4941')
sha256sums=('143f2d55d9a188544b013910436d13e01ec75a31d6699182bbf74d7034ab42ef')
