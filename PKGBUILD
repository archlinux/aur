# Maintainer: alvaniss <alvaniss1g@gmail.com>
pkgname=imount
pkgver=1.0.1
pkgrel=1
pkgdesc="Script that allows to mount iOS devices on Linux to manage their files, built around ifuse."
arch=(
  'any'
)
url="https://github.com/alvaniss/imount"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'ifuse'
  'xdg-utils'
)
source=(git+https://github.com/alvaniss/imount.git)
sha256sums=('SKIP')

build() {
  :
}

package() {
  cd "$srcdir/imount"
  install -Dm755 imount.sh "$pkgdir/usr/bin/imount"
}
