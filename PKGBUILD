# Maintainer: Jason Staten <jstaten07 gmail>
# Co-maintainer: Thor K. Høgås <thor alfakrøll roht dott no>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-wercker-cli

pkgname=wercker-cli
pkgver=1.0.1062
pkgrel=1
pkgdesc='Wercker CLI'
url='http://wercker.com/cli'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
md5sums=('66a2a98dc4aa10f623da84a1e27cb590')
sha256sums=('71d598bc18386f0ac9792d41b48a62e0fcd1000fcd17dc5339999ec9f3a38ec9')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
