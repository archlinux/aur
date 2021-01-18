# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.15.0
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
sha256sums=('d18f4def23bf9eed2518b6f5332098410ee33ec70887c6dc50fb5fc058e941e6')
sha512sums=('a45549c043a8467695a4634ac0e8070755ae1b68a1b1ec9f678ab2086d688f08e79f720e439f6cf0b549ce0495b0318415f857fdf0231748d829cb5bc1703c98')
