# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=masterscp
pkgver=20170102
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

md5sums=('85a8f6225af48769fa407c16d8dcb365')
sha256sums=('ba1ad2f4e3cf4604476c4774ed1bd3515b03f3c2ccc2a3166a602bddc5537d8e')
