# Maintainer: Jason Staten <code.aur@jxs.me>
# PKGBUILD Source: https://git.sr.ht/~statianzo/pkgbuild-sauceconnect

pkgname=sauceconnect
pkgver=4.8.1
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://wiki.saucelabs.com/display/DOCS/Setting+Up+Sauce+Connect+Proxy'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('e9adbc6e8248767920b82913928f4845')
sha256sums=('0539f8a881b9f24cfc432c0731d0e6e862e139d13097e7d14008bd09b5f11bc1')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
