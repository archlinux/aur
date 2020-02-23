# Maintainer: Karel Louwagie <aur at karellouwagie dot net>
pkgname=rainloop
pkgver=1.14.0
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
sha256sums=('906dcc7d233b64083ddd3b0665c7271408c331c9a97f94fc710081c82a79c124')
sha512sums=('effc8de581252081d4934ef2087c5a9a26c58757fd55bb8cd98f43367779ac21215689ad8b6a32d321afb3ef8e53c2e49b9cbb04495819723fedcfa8752ebb7c')
