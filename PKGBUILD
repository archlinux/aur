# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-wercker-cli

pkgname=wercker-cli
pkgver=1.0.643
pkgrel=1
pkgdesc='Wercker CLI'
url='http://wercker.com/cli'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
md5sums=('97c3b6b361d4493d41f0ecee712b8142')
sha256sums=('13baac83cfafe6663401e6b5b2cf95ee453255a2100a6c68dc1933a14258b05b')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
