# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.16.0
pkgrel=2
pkgdesc="Simple, modern & fast web-based email client"
arch=("any")
url="https://www.rainloop.net"
license=("AGPL3")
depends=("php")
source=(https://github.com/RainLoop/rainloop-webmail/releases/download/v${pkgver}/rainloop-community-${pkgver}.zip)

package() {
  install -d -m0750 $pkgdir/usr/share/webapps/rainloop/data
  install -d -m0755 $pkgdir/usr/share/webapps/rainloop/rainloop
  install -D -m0644 $srcdir/index.php $pkgdir/usr/share/webapps/rainloop/index.php
  cp -rf $srcdir/rainloop/. $pkgdir/usr/share/webapps/rainloop/rainloop/
}
sha256sums=('db949c4363b048a02eaa0f06a26a8386979b8734198c2939ee1e8cc54362ca67')
sha512sums=('1ec03bff24536328aeaca8fdc53d65f7b7a154ee674658135d6bcc0019e375d027e31b82eeb0e1e600ddeba00329775ae1b92cd9fabb5f7c14427994800acf8a')
