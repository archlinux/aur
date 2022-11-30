# Maintainer: neXyon <nexyon at gmail dot com>

pkgname=xkb-mine-custom-layout
pkgver=1
pkgrel=1
pkgdesc='Installs the German mine keyboard layout as custom xkb layout'
arch=('any')
url="https://neo-layout.org/Layouts/mine/"
depends=()
provides=()
conflicts=()
source=('https://dl.neo-layout.org/mine')
md5sums=('cb7812582e9e2658cab89df40fff7f8a')

package() {
  cd "$srcdir"

  install -Dm644 mine "$pkgdir/usr/share/X11/xkb/symbols/custom"
}

