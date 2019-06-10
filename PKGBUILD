# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=shift-not-pressed
pkgver=1.0.0
pkgrel=1
pkgdesc='Detect if shift is NOT pressed in the console'
arch=('any')
url='https://aur.archlinux.org/packages/shift-not-pressed'
license=('custom:Public Domain')
makedepends=('gcc')
source=(shift-not-pressed.c)
sha256sums=('7191bd1b8632c877d4473735d60196b6709c1bb26336065b9fd4ba4cb4ce8184')

build() {
  cd $srcdir
  gcc -o shift-not-pressed shift-not-pressed.c
}

package() {
  cd $srcdir
  install -Dm755 shift-not-pressed "$pkgdir/usr/bin/shift-not-pressed"
}
