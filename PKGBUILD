# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2019.1.7
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
optdepends=('chromium' 'google-chrome')
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('77d1aff7fea3ade0c2cfc3d999428dcbbc4a31827774d489a6c95e8d6256924c3ade6c540a039a8c9aec599538ead802cbaa56d26eaff62018403ca7dc53e72c')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
