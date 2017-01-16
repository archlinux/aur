# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
pkgver=3.23
pkgrel=1
pkgdesc="Documentation/help when using FLDIGI w/out i-net access"
arch=('any')
url="http://w1hkj.com/Fldigi.html"
license=('GPL')
optdepends=('fldigi' 'epdfview')
source=(https://sourceforge.net/projects/fldigi/files/fldigi/fldigi-help.pdf)

package() {
	cd $srcdir

	install -Dm644 fldigi-help.pdf $pkgdir/usr/share/fldigi/docs/fldigi-help.pdf
}
md5sums=('49a27cc3a9dc51c3f7a814f040374ed2')
sha256sums=('6b599132b7aa03d5d2d774e61c37b95cf63dd44548ccf90dc697eb7dae24a76e')
