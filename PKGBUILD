# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-sauceconnect

pkgname=sauceconnect
pkgver=4.3.8
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('233a0b2bacc6e7060314479ba51d0dba')
sha256sums=('1bd4222b673b111684ea4e2563468b58261ff13b2cb9104f21bbf536191fbe71')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
