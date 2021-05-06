# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.16.0
pkgrel=1
pkgdesc="Simple, modern & fast web-based email client"
arch=("any")
url="https://www.rainloop.net"
license=("AGPL")
depends=("php")
source=(https://github.com/RainLoop/rainloop-webmail/releases/download/v${pkgver}/rainloop-${pkgver}.zip)

package() {
  install -d -m0750 $pkgdir/usr/share/webapps/rainloop/data
  install -d -m0755 $pkgdir/usr/share/webapps/rainloop/rainloop
  install -D -m0644 $srcdir/index.php $pkgdir/usr/share/webapps/rainloop/index.php
  cp -rf $srcdir/rainloop/. $pkgdir/usr/share/webapps/rainloop/rainloop/
}
sha256sums=('6980b0a85aa124479a927e11d0c50319c4a9f8ce3b25b6c2adb61a30bf1a792b')
sha512sums=('86c9c234b96405efb35c5fff17f28a23b75350a1432f701e341fc4f01f5f16e63ed0b6f134b5d90206c2d69c5c81f307c46dd77cadefb5b5cbcd6e7a9c9a44f7')
