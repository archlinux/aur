# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=cuelang-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
arch=('x86_64')
url="https://cuelang.org/"
license=('Apache-2.0')
provides=("cuelang=${pkgver}")
conflicts=("cuelang-cue-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('36c454c8ab48e3fe1d0bb10a461b8b4e362566b50048a5e2808e221248f373d5')

package() {
  cd ${srcdir}/
  install -Dm755 cue "$pkgdir"/usr/bin/cue
}
