# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=masterscp
pkgver=20240502
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

md5sums=('3c0dd0d9e6fe6b55eb6725fe967d93ce')
sha256sums=('c51e390750fc1dcc4a8d06565aa0a881f6ad179cb91a2b489f03b8d39714f116')
