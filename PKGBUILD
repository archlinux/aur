# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: GloriousEggroll <https://youtu.be/uxWJ1xvowMk>

pkgname=killwine
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell script for killing Wine and Proton processes"
url="https://github.com/begin-theadventure/killwine"
arch=('any')
source=("killwine.sh")
sha256sums=('373d80b5fb442ffc310f7934ef4256e6faaebbb6b860eabc44d4a77eab8303b4')

package() {
  install -Dm755 killwine.sh "$pkgdir/usr/bin/killwine"
}
