pkgname=warfork-data
pkgver=4269802.OCT.8.201
_dataver=4269802-OCT-8-2019
pkgrel=1
pkgdesc='Warfork assets'
arch=('any')
license=('custom')
url='https://github.com/TeamForbiddenLLC/warfork-assets'
source=("https://github.com/TeamForbiddenLLC/warfork-assets/archive/${_dataver}.tar.gz")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/share/games/warfork/basewf
  cp -r "$srcdir"/warfork-assets-${_dataver}/* "$pkgdir"/usr/share/games/warfork/basewf
}
