# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=werf-bin
pkgver=1.2.196
pkgrel=1
pkgdesc='Kubernetes build and delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
conflicts=("werf-git")
source=("https://tuf.werf.io/targets/releases/${pkgver}/linux-amd64/bin/werf")
sha256sums=('800d80e7964dc31b49c61547eb1933d5e5c025ad408cca73e8646d6edd2939c7')

package() {
  install -Dm755 werf "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
