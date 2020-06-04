# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname='rancher-k3d-beta-bin'
pkgver="3.0.0_rc.1"
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker. Pre-release Versions'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=('k3d')
conflicts=('rancher-k3d-bin')
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-amd64")
sha256sums=('1f4a9111996050c4c1007399cbb38e01f896d8029e839a0719f009409cb916a6')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
