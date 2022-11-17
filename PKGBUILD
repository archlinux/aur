# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=werf-bin
pkgver=1.2.190
pkgrel=1
pkgdesc='Kubernetes build and delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
conflicts=("werf-git")
source=("https://tuf.werf.io/targets/releases/${pkgver}/linux-amd64/bin/werf")
sha256sums=('64cdb7943971e2033184e0b6722032f5958cfdb45321445879cce04c91736122')

package() {
  install -Dm755 werf "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
