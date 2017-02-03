# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=pymultimonaprs
pkgver=1.3.1
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
sha1sums=('e79b3db429b2be9a9ad31990cca66d6d16d7aae5')


package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --optimize=1 --prefix=/usr --root=$pkgdir
}
