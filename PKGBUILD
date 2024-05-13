# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=werf-bin
pkgver=1.1.35
pkgrel=1
pkgdesc='Kubernetes build and delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
conflicts=("werf-git")
source=("https://tuf.werf.io/targets/releases/${pkgver}/linux-amd64/bin/werf")
sha256sums=('674eb8b89bd0d949c46c6abbf299e04e7e68c5c25a8bdaf817343db3d21f6a40')

package() {
  install -Dm755 werf "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
