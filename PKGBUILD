# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.11.7
pkgrel=1
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('69a0c0188d593e6ecdeceb571f0a2b37')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleetd "$pkgdir/usr/bin/fleetd"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
