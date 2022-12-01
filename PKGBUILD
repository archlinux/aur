# Maintainer: neXyon <nexyon at gmail dot com>

pkgname=xkb-mine-custom-layout
pkgver=1
pkgrel=2
pkgdesc='Installs the German mine keyboard layout as custom xkb layout'
arch=('any')
url="https://neo-layout.org/Layouts/mine/"
depends=()
provides=()
conflicts=()
source=('https://dl.neo-layout.org/custom_mine')
md5sums=('1bc22b982166589d11548e4e88aa1c4f')

package() {
  cd "$srcdir"

  install -Dm644 custom_mine "$pkgdir/usr/share/X11/xkb/symbols/custom"
}

