# Maintainer:

_newpkg='moment-git'
_pkgname='matrix-mirage'
pkgname="$_pkgname-git"
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc="metapackage - migrate to $_newpkg"
arch=('any')

conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
  depends=("$_newpkg")
}
