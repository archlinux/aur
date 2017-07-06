# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='shellshock'
pkgver=1.11
pkgrel=1
pkgdesc='A top-down space shooter written for Bash'
arch=('any')
url='http://www.dhampir.no'
license=('GPL2')
depends=('bash')
source=(https://dhampir.no/stuff/bash/shellshock)
sha512sums=('80f1ab4410318b9e7d2ab765e18f1d6b6415edb1bf631ed95b580726ec3a5346457da1e8423ab5bb15e6d98675cce467d4f6f43888d43221460ad2218d8d88f4')
_prefix=usr/bin

package() {
  cd "${srcdir}/"
  install -Dm0755 shellshock "${pkgdir}/${_prefix}/shellshock"
}
