# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=werf-bin
pkgver=1.1.21.fix22
_pkgver=1.1.21+fix22
pkgrel=1
pkgdesc='GitOps delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
source=("${pkgname}-${_pkgver}::https://dl.bintray.com/flant/werf/v${_pkgver}/werf-linux-amd64-v${_pkgver}")
sha256sums=('5abdbe88c365db49446743de5d5acdbd935f8bca30c5821ae42322be8c4f91b6')

package() {
  install -Dm755 "${srcdir}"/werf-* "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et:
