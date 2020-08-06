# Maintainer: Thorsten Schifferdecker (curx) <ts@systs.org>

pkgname=osm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="The Open Service Mesh CLI - binary"
arch=('x86_64')
url=https://github.com/openservicemesh/osm
license=('MIT')
provides=('osm')
conflicts=('osm')
source=("${url}/releases/download/v${pkgver}/osm-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('0edfe6842c56714c6407472e430ca839896efcd62ee246c0c0577f799bc5dfc3')

package() {
  cd "linux-amd64"
  install -Dm755 osm "${pkgdir}/usr/bin/osm"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/osm-cli-bin"
}
