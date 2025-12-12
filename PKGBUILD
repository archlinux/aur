pkgname=mpkg
pkgver=1.0
pkgrel=1
pkgdesc="Simple AUR helper that installs and removes AUR packages"
arch=('x86_64')
license=('GNU GPLv3')
depends=('git' 'base-devel')
makedepends=('gcc')
source=("mpkg.c")
sha256sums=('SKIP')

build() {
  gcc -o mpkg mpkg.c
}

package() {
  install -Dm755 mpkg "$pkgdir/usr/bin/mpkg"
}
