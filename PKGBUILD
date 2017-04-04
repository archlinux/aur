# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=masterscp
pkgver=20170402
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

md5sums=('8e769729e19bc9db913a09689dec7441')
sha256sums=('e419ea86fc271e3ea99748b1b1a264ee44b2351ad406bfc763d38a1466d0d456')
