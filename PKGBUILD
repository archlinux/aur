# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-wercker-cli

pkgname=wercker-cli
pkgver=1.0.174
pkgrel=1
pkgdesc='Wercker CLI'
url='http://devcenter.wercker.com/docs/using-the-cli/index.html'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
md5sums=('381460d2c93ddd5c6da1471e9544f904')
sha256sums=('2d5128cf65a8a938283186c8298d7a958fc3033f310f05e03c22ff17160699ef')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
