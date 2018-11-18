# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2018.10.31
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
optdepends=('chromium' 'google-chrome')
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('f76697ec40a81ff660b879e72f6741504d08e3f285490296a4c3a67449f43994577c85caab00c6b34066426aa67b7b387f8e7ddd4f39021911934f49c6322dc3')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
