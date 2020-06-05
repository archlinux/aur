# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname='rancher-k3d-beta-bin'
pkgver="3.0.0_rc.2"
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker. Pre-release Versions'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=('k3d')
conflicts=('rancher-k3d-bin')
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-amd64")
sha256sums=('e37adffe15ff67c5ed5518a295a198d008363ffe546726686856807b2dcf5860')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
