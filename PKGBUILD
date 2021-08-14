# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
__pkgname=fldigi
pkgver=4.1.19
pkgrel=1
pkgdesc="Documentation/help when using FLDIGI w/out i-net access"
arch=('any')
url="http://w1hkj.com/Fldigi.html"
license=('GPL')
optdepends=('fldigi' 'epdfview')
source=(https://sourceforge.net/projects/$__pkgname/files/$__pkgname/${__pkgname}-help.pdf)

package() {
	cd $srcdir

	install -Dm644 ${__pkgname}-help.pdf $pkgdir/usr/share/fldigi/docs/fldigi-help.pdf
}
md5sums=('2615fc5e00954fa704901b6cec38cff1')
sha256sums=('b4151ce3dc5d945112475b738083213a91dff4d63accc4a9f06047c9b5590c6f')
