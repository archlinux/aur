# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gimp-palletes-davidrevoy
pkgver=2
pkgrel=1
pkgdesc='Palettes for Gimp made by Davide Revoy'
arch=('any')
url='http://www.davidrevoy.com/article27/palettes-for-gimp-mypaint-or-krita'
license=('CCPL:by')
groups=()
depends=()
makedepends=()
optdepends=('gimp: to use these palettes')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=''
source=("$pkgname-$pkgver.tar.gz::http://www.davidrevoy.com/data/documents/davidrevoy-palettes-v${pkgver}.tar.gz")
noextract=()

package(){
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/gimp/2.0/palettes
  install -Dm644 *.gpl "$pkgdir"/usr/share/gimp/2.0/palettes/
}

md5sums=('8d1bd77f5c67e011690322fef8b29189')
