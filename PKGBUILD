# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=FLDigi
pkgver=3.22
pkgrel=1
pkgdesc="Documentation/help when using FLDIGI w/out i-net access"
arch=('any')
url="http://w1hkj.com/Fldigi.html"
license=('GPL')
optdepends=('fldigi' 'epdfview')
source=(http://w1hkj.com/downloads/fldigi/${_pkgname}_${pkgver}_Users_Manual.pdf)

package() {
	cd $srcdir

	install -Dm644 ${_pkgname}_${pkgver}_Users_Manual.pdf $pkgdir/usr/share/fldigi/docs/fldigi.pdf
}
md5sums=('1fcb85fe1c9ed8e29e6595f696a3e3a3')
sha256sums=('365892b80d36b11c2aa5c72827489aa67795e5618543270441c6fcb9d64aa31d')
