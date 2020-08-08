# Maintainer: Thorsten Schifferdecker (curx) <ts@systs.org>

pkgname=osm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="The Open Service Mesh CLI - binary"
arch=('x86_64')
url=https://github.com/openservicemesh/osm
license=('MIT')
provides=('osm')
conflicts=('osm')
source=("${url}/releases/download/v${pkgver}/osm-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('91faacd60e1919ce70d3c68bbfa5e783d9116575f673d67b47eb41cf1bf909d3')

package() {
  cd "linux-amd64"
  install -Dm755 osm "${pkgdir}/usr/bin/osm"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/osm-cli-bin"
}
