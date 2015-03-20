# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2014.1.3
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
depends=()
makedepends=()
options=()
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('db27cf1de4f82cf58843ce7e37c768100e6ce1bf18dbb632897e600862425cc5c50e63c8ed4c43357c1470636a0550f673641eef2e6614b37e3947ca08b978a9')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
