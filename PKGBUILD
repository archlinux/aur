# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=cuelang-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
arch=('x86_64')
url="https://cuelang.org/"
license=('Apache-2.0')
provides=("cuelang=${pkgver}")
conflicts=("cuelang-cue-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('9f1640d086f20c6f0114aa7579b6e51670cd881865dee9153cb188a3020bf8b1')

package() {
  cd ${srcdir}/
  install -Dm755 cue "$pkgdir"/usr/bin/cue
}
