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
md5sums=('5c26b0ec9bcef054c47d1a035e90b20c')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
