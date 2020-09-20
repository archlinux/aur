# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=cuelang-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
arch=('x86_64')
url="https://cuelang.org/"
license=('Apache-2.0')
provides=("cuelang=${pkgver}")
conflicts=("cuelang-cue-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('810851e0e7d38192a6d0e09a6fa89ab5ff526ce29c9741f697995601edccb134')

package() {
  cd ${srcdir}/
  install -Dm755 cue "$pkgdir"/usr/bin/cue
}
