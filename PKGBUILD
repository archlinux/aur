pkgname=warfork-data
pkgver=4269802.OCT.8.2019
_fullver=4269802-OCT-8-2019
pkgrel=1
pkgdesc='Warfork assets'
arch=('any')
license=('custom')
url='https://github.com/TeamForbiddenLLC/warfork-assets'
source=("git+https://github.com/TeamForbiddenLLC/warfork-assets.git#branch=$_fullver")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/share/games/warfork/basewf
  cp -r "$srcdir"/warfork-assets/* "$pkgdir"/usr/share/games/warfork/basewf
}
