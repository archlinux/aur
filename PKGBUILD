# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=werf-bin
pkgver=1.2.169
pkgrel=1
pkgdesc='Kubernetes build and delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
conflicts=("werf-git")
source=("https://tuf.werf.io/targets/releases/${pkgver}/linux-amd64/bin/werf")
sha256sums=('8dfc3e42d20155e9a7fa8e18445cab86eae85e870d4b04067f3114a1220461e9')

package() {
  install -Dm755 werf "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
