# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-amd64")
sha256sums=('58a25950f855102a3e5c6b5af381ac5443b72c69d1c3ebb8f193e75629c4a995')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
