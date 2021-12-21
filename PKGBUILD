# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=doasedit
pkgver=0.7
pkgrel=1
pkgdesc="Allow doas users to edit root-owned files by running an unpriviledged editor"
arch=('any')
url="https://gitlab.com/magnustesshu/doasedit"
license=('GPL')
depends=('doas')
md5sums=()
noextract=('doasedit')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 ../doasedit "${pkgdir}/usr/bin"
}
