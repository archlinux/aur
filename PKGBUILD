# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=werf-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='Kubernetes build and delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
conflicts=("werf-git")
source=("https://tuf.werf.io/targets/releases/${pkgver}/linux-amd64/bin/werf")
sha256sums=('aee7cfdc33a479298f9d271a03e03ca3e5491b9250d0be99f1b410a962a07587')

package() {
  install -Dm755 werf "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
