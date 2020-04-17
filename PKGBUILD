# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=cuelang-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
arch=('x86_64')
url="https://cuelang.org/"
license=('Apache-2.0')
provides=("cuelang=${pkgver}")
conflicts=("cuelang-cue-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('6405bc947cdd5fbee6f6af4b440000503e548cb45a689c0cb72846bc7a694c9e')

package() {
  cd ${srcdir}/
  install -Dm755 cue "$pkgdir"/usr/bin/cue
}
