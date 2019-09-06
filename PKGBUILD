# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='shellshock'
pkgver=1.11
pkgrel=3
pkgdesc='A top-down space shooter written for Bash'
arch=('any')
url='http://www.dhampir.no'
license=('GPL2')
depends=('bash')
source=(https://dhampir.no/stuff/bash/shellshock)
sha512sums=('b62958014c404eece29983c0579a66fa34ad4904bb107d8bb695b8f3cca99a345525fb8cdae3937231c9a2f25ad98ecb6d5050d56ee4e06c44df3192fc415577')

package() {
  install -Dm0755 shellshock "$pkgdir/usr/bin/shellshock"
}
