# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=pymultimonaprs
pkgver=1.2.0
pkgrel=1
pkgdesc="RF2APRS-IG Gateway"
arch=(any)
url="http://asdil12.github.io/pymultimonaprs/"
license=('GPL')
groups=()
provides=()
depends=('python2' 'multimon-ng-git' 'rtl-sdr' 'python2-setuptools')
backup=('etc/pymultimonaprs.json')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/asdil12/pymultimonaprs/tar.gz/$pkgver")
sha1sums=('8409852e80257e68f9ea31f1774538dc3d40dbf5')

package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --optimize=1 --prefix=/usr --root=$pkgdir
}
