# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=masterscp
pkgver=20251126
pkgrel=1
pkgdesc="Super Check Partial Database Files for Ham Radio Contesting"
arch=('any')
url="http://www.supercheckpartial.com/"
license=('GPL-2.0-or-later')
source=(${url}/SCP_VER${pkgver}.zip)

package() {
	mkdir -p  $pkgdir/usr/share/masterscp

	cd $srcdir

	cp -R *.{DTA,SCP} $pkgdir/usr/share/masterscp
}

md5sums=('6977b3b22fe3bb12597394b7b3092c5c')
sha256sums=('45733332b784d0cc123cc8d3be4fcd39a21c9de822d71ff05d44333a4f262e31')
