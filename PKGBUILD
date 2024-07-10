# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: GloriousEggroll <https://youtu.be/uxWJ1xvowMk>

pkgname=killwine
pkgver=1.0.0
pkgrel=3
pkgdesc="A shell script for killing Wine and Proton processes"
url="https://github.com/begin-theadventure/killwine"
arch=('any')
depends=('wine')
source=("killwine.sh")
sha256sums=('7a27ba8d452b274be3b42a6938f0bff1403b11f918d99212ff700d9a391389a0')

package() {
  install -Dm755 killwine.sh "$pkgdir/usr/bin/killwine"
}
