# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-sauceconnect

pkgname=sauceconnect
pkgver=4.3.6
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('38b1f0067f4785489024bacd13913580')
sha256sums=('0e1467a7bbe1b687358c321ae68c635fdd510bb7303a0671f90041936745e0b9')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
