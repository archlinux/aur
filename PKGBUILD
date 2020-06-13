# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Mads Mogensen <mads256h at gmail dot com>

pkgname=https-everywhere-chrome
pkgver=2020.5.20
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
optdepends=('chromium' 'google-chrome')
source=(https://www.eff.org/files/$pkgname-$pkgver.crx)
sha512sums=('541f4f9047b2294ef0ad9f06308df5935fec76ccaf93595524d65ad2089898ff32353457576110689917532d472a8dfbbb8f884fbc79175d9474f12c678c05b1')

package() {
	 mkdir -p $pkgdir/usr/share/$pkgname
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.crx
}
