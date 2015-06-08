# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=pymultimonaprs
pkgver=1.1.0
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
sha1sums=('134e49453335d32454930b70adf24db248c08687')

package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --optimize=1 --prefix=/usr --root=$pkgdir
}
