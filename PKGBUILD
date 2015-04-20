# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2015.4.7
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
depends=()
makedepends=()
options=()
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('515d3caba50fd1452d483cdec2367c8a90194aef7df9998bd28288d8a316a5dcddf2c8e04d284369aafbab11141f00811b9d94d9a08da6b456e97fb19a3618a0')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
