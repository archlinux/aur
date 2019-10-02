# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.13.0
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
sha256sums=('e3ec8209cb3b9f092938a89094e645ef27659763432bedbe7fad4fa650554222')
sha512sums=('37fb3bcc1f4c2a4cbcbcec1b6f61d12050157c985df18ec3e377fb31dc2a877a12f5c1bb8614d4cf19b33452e90a5d47c93dadde55d9c97137afd061c90bbc32')
