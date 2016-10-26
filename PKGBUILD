# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-sauceconnect

pkgname=sauceconnect
pkgver=4.4.1
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('11ab854eb4842d7efde419b3c2ddca8e')
sha256sums=('613c1d4e965cb8d1819ac29f18e6dc9960286f9ba34787f6de90b4f01a1d8985')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
