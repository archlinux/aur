# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-wercker-cli

pkgname=wercker-cli
pkgver=1.0.405
pkgrel=1
pkgdesc='Wercker CLI'
url='http://wercker.com/cli'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
md5sums=('605b854454c527944f8be60d73d647eb')
sha256sums=('5f0691293112fe160df121dce50589bf08494401df294bad973867003264b508')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
