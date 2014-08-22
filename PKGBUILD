# Maintainer: Jason Staten <jstaten07 gmail>
pkgname=sauceconnect
pkgver=4.3
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://saucelabs.com/docs/connect'
license=('unknown')
arch=('i686' 'x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('978dc49aa70d3daf8f8c512366cf5d6e')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
