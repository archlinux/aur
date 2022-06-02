# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='shellshock'
pkgver=1.15
pkgrel=1
pkgdesc='A top-down space shooter written for Bash'
arch=('any')
url='http://www.dhampir.no'
license=('GPL2')
depends=('bash')
source=(https://dhampir.no/stuff/bash/shellshock)
sha512sums=('17ce85e8c14bf489f14de092f180707f36376de11c778845458540710f8a666daa37bae2d1dad725ffa760a623986c776f2c66fdd24a90fc580ecf31d228cff2')

package() {
  install -Dm0755 shellshock "$pkgdir/usr/bin/shellshock"
}
