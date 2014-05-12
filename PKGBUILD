# Maintainer: Jason Staten <jstaten07 gmail>
pkgname=sauceconnect
pkgver=4.1
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='https://saucelabs.com/docs/connect'
license=('unknown')
arch=('i686' 'x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux.tar.gz")
md5sums=('f087925c62220d7e450d4181362fe05d')

package() {
  cd "${srcdir}/sc-${pkgver}-linux/"
  install -D -m755 "bin/sc"                "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect/license.html"

}
