# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2018.9.19
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
optdepends=('chromium' 'google-chrome')
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('75b497506afefb13f6a66793405e42414362a5f6d1a8ebf665f72f3828f9de890ec65e39bb345e0785d8c882403039f1fca96d3e2afa6589e7540abf31ebaa7a')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
