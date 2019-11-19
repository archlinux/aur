# Maintainer: Jason Staten <code.aur@jxs.me>
# PKGBUILD Source: https://git.sr.ht/~statianzo/pkgbuild-sauceconnect

pkgname=sauceconnect
pkgver=4.5.4
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://wiki.saucelabs.com/display/DOCS/Setting+Up+Sauce+Connect+Proxy'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('68f1f22e92efd444591328ace15c25e9')
sha256sums=('6eb18a5a3f77b190fa0bb48bcda4694d26731703ac3ee56499f72f820fe10ef1')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
