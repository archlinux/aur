# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='shellshock'
pkgver=1.14
pkgrel=3
pkgdesc='A top-down space shooter written for Bash'
arch=('any')
url='http://www.dhampir.no'
license=('GPL2')
depends=('bash')
source=(https://dhampir.no/stuff/bash/shellshock)
sha512sums=('c2a0b0e1c6c245b208b1b18f135a9e113a19d8ce9cb5930658021cb2cdb4c89d753be7edb36bc5e0ddb9ed32a545ad98241f2ad6eca67a6566b723c1ad065f27')

package() {
  install -Dm0755 shellshock "$pkgdir/usr/bin/shellshock"
}
