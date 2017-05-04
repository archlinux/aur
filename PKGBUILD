# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
__pkgname=fldigi
pkgver=4.0
pkgrel=2
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
md5sums=('0810666b9347e1e7d99172d1a3fb4b3d')
sha256sums=('89853495a570b191125d9adfb42b3ac9ae1277ab6825ae7543e43f8c0ab8f0ef')
