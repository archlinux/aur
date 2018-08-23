# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2018.8.22
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
depends=()
makedepends=()
options=()
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('69aada92267a6afcc710a8456e219ff0e402d1d99386788c578a18568825a266ab1cb97fbc8b41fe6e4091065dd38b2b6e049f9ddec7b819213f3efac225befc')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
