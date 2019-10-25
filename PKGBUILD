# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=1.3.4
pkgrel=2
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-amd64")
sha256sums=('41e0579b1499f6051e9d0d8a6d39d5f419e1037851c0121b676190af5825f4c0')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
