# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=cuelang-bin
pkgver=0.0.15
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
arch=('x86_64')
url="https://cuelang.org/"
license=('Apache-2.0')
provides=("cuelang=${pkgver}")
conflicts=("cuelang-cue-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('5a6706a698a87fdce68aae4778b7218d8814a3dc5957223441db7165b52eab4f')

package() {
  cd ${srcdir}/
  install -Dm755 cue "$pkgdir"/usr/bin/cue
}
