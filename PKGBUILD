# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.17.0
pkgrel=2
pkgdesc="Simple, modern & fast web-based email client"
arch=("any")
url="https://www.rainloop.net"
license=("MIT")
depends=("php")
source=(https://github.com/RainLoop/rainloop-webmail/releases/download/v${pkgver}/rainloop-legacy-${pkgver}.zip)

package() {
  install -d -m0750 $pkgdir/usr/share/webapps/rainloop/data
  install -d -m0755 $pkgdir/usr/share/webapps/rainloop/rainloop
  install -D -m0644 $srcdir/index.php $pkgdir/usr/share/webapps/rainloop/index.php
  cp -rf $srcdir/rainloop/. $pkgdir/usr/share/webapps/rainloop/rainloop/
}
sha256sums=('782dcabacadab5d7176f7701dd23319a040b2cfbf974fac6df068600cf69c50a')
sha512sums=('cca3ec2b7ca0f3d1173fe4c48849db73779a7ef6ec6d5a521b85321677187cd11de10a7929eefd73db2f95b6ef289db362d5ed18c168a4fb023f7dc4ec34d06b')
