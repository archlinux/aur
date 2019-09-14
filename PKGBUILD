# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-amd64")
sha256sums=('52b127b76ef76652adf94e8310c85270ae24831ca222bb082d5ced0e80380916')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
