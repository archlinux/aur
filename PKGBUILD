# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=masterscp
pkgver=20141118
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

md5sums=('879e22ecc189aaae434258b12ca98608')
sha256sums=('2b1e91a0e98b541726115275671f5215215db9f2328231b9cdda66966d144768')
