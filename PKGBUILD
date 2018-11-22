# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://git.sr.ht/~statianzo/pkgbuild-sauceconnect

pkgname=sauceconnect
pkgver=4.5.1
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://wiki.saucelabs.com/display/DOCS/Setting+Up+Sauce+Connect+Proxy'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('d98a357947a2a6ba6a14d62a8a3285cf')
sha256sums=('dd53f2cdcec489fbc2443942b853b51bf44af39f230600573119cdd315ddee52')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
