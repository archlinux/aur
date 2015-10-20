# Maintainer: Ivan <hideaki02@gmail.com>

pkgname="keepass-plugin-kpgooglesync"
_pkgname="kp-googlesync"
pkgver=2.1.2
pkgrel=1
pkgdesc="Synchronize KeePass database with Google Drive using Google API."
arch=("any")
url="https://sourceforge.net/projects/kp-googlesync"
license=("GPLv3")
depends=("keepass")
makedepends=("unzip")
source=("http://downloads.sourceforge.net/project/$_pkgname/GoogleSyncPlugin-2.x/GoogleSyncPlugin-$pkgver.zip")
md5sums=('c17982149016ba10d16c48b6a85ff955')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/keepass/plugins"
  unzip -j "GoogleSyncPlugin-$pkgver.zip" "GoogleSyncPlugin.plgx" -d "$pkgdir/usr/share/keepass/plugins"
}

