# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=1.3.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-amd64")
sha256sums=('b63501e58b859f6475a07cdf2d61e4bca1d3ce3d3df836086aae958d57b7ff95')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
