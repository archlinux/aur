# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2018.6.21
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
depends=()
makedepends=()
options=()
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('55256046ab2d7001a0faae2d27554efbc260d5d5e8d62eff6a08a093ad80f01ec51c45943872aae2905d612c41f4b426ede14770f96af2e0549ed30ed3bc18ff')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
