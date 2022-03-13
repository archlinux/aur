# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=masterscp
pkgver=20220302
pkgrel=1
pkgdesc="Super Check Partial Database Files for Ham Radio Contesting"
arch=('any')
url="http://www.supercheckpartial.com/"
license=('GPL')
source=(${url}/SCP_VER${pkgver}.zip)

package() {
	mkdir -p  $pkgdir/usr/share/masterscp

	cd $srcdir

	cp -R *.{DTA,SCP} $pkgdir/usr/share/masterscp
}

md5sums=('65bfeecf0648a2196735fea3ca42441d')
sha256sums=('86fc990627b2556b202c20bb24de08fe2a9e1194ad0e9566d5b5dfc3fdce06f0')
