# Maintainer: Jun Yang <harttleharttle@gmail.com>

pkgname=fsed
pkgver=latest
pkgrel=1
pkgdesc="Rename files in batch using sed syntax"
source=('fsed')
arch=('x86_64')
url="https://github.com/harttle/fsed"
license=('MIT')
depends=('sed' 'coreutils')
provides=("${pkgname}")
conflicts=("${pkgname}")
pkgbase=fsed

package() {
  mv "fsed" "${pkgdir}/usr/bin"
}
sha256sums=('9f1a81b1bfdef4566612639866157468b1fc4faffb3507deb90aeca1cd65d7c0')
