# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-sauceconnect

pkgname=sauceconnect
pkgver=4.4.11
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('0cc8eb5c8211b1d782c5c2362248afef')
sha256sums=('b61557580d3496f80421914af897b583ed1117493643fc991f7d6ee5c79b46ee')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
