# Maintainer: Jason Staten <jstaten07 gmail>
# Co-maintainer: Thor K. Høgås <thor alfakrøll roht dott no>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-wercker-cli

pkgname=wercker-cli
pkgver=1.0.643
pkgrel=2
pkgdesc='Wercker CLI'
url='http://wercker.com/cli'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
sha256sums=('5f0691293112fe160df121dce50589bf08494401df294bad973867003264b508')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
