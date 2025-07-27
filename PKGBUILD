# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tdns-bin
_pkgname=tdns
pkgver=0.4.0
pkgrel=1

pkgdesc="A powerful, lightweight CLI to manage Technitium DNS server via HTTP API endpoint"
arch=('x86_64')
url='https://github.com/mbevc1/tdns'
license=('MPL-2.0')
makedepends=('make' 'coreutils')
provides=('mcjoin')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/tdns_${pkgver}_linux_amd64.tar.gz" "tdns-LICENSE::https://raw.githubusercontent.com/mbevc1/tdns/refs/tags/v${pkgver}/LICENSE")
sha256sums=('6ee697e1d517301d68df7713f76e796403ee4262ee074a7c89df52d039327174' 'SKIP')

package() {
  install -Dm 755 tdns -t $pkgdir/usr/bin/
  install -Dm 644 tdns-LICENSE -T $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
