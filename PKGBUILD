# Original Maintainer: mariusn <marius softpedia com>
# Maintainer: HanFox <hanfox dot co dot uk>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
 
pkgname=trillian
pkgver=2.0.0.5
pkgrel=1
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
arch=('i686' 'x86_64')
url="https://www.trillian.im"
license=('Proprietary')
depends=('gtkmm3' 'libzip' 'openssl' 'webkitgtk' 'libnotify' 'libpulse' 'libxss' 'librsvg')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
 
source_x86_64=("https://www.trillian.im/get/linux/2.0/?deb=64")
source_i686=("https://www.trillian.im/get/linux/2.0/?deb=32")
md5sums_x86_64=('47b01ab8c2dd5e3b1ae51a19492f7a4c')
md5sums_i686=('a35ecdf0da66c240d0b604d7fa76cc5b')
 
 
package() {
  tar xzvf "$srcdir/data.tar.gz" -C "$pkgdir/"
}