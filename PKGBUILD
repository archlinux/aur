# Maintainer: Jason Staten <code.aur@jxs.me>
# PKGBUILD Source: https://git.sr.ht/~statianzo/pkgbuild-sauceconnect

pkgname=sauceconnect
pkgver=4.5.3
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://wiki.saucelabs.com/display/DOCS/Setting+Up+Sauce+Connect+Proxy'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('e0b8bad3c82dffe8c872c12a784b9626')
sha256sums=('0de7fcbcb03ad400e886f2c4b34661eda55808e69c7bc4db6aa6aff85e4edb15')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
