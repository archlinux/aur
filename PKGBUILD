# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-sauceconnect

pkgname=sauceconnect
pkgver=4.3.9
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('4cedface7a3c0a1a4ee08388c5889b71')
sha256sums=('9cb223cc3cd59bc1222b7432a8cafbcfdeafd51e91fc2a2090d9d41eca1863f4')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
