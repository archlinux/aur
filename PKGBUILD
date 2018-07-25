# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=shrinky-intro
pkgver=1.0.0
pkgrel=1
pkgdesc='Linux 4k intro skeleton (from dnload)'
arch=('x86_64')
url='https://github.com/xyproto/shrinky-intro/'
license=('BSD')
makedepends=('git' 'shrinky')
depends=('libgl' 'sdl2')
source=("git+https://github.com/xyproto/shrinky-intro#tag=v$pkgver")
md5sums=("SKIP")

build() {
  shrinky $pkgname/main.cpp
}

package() {
  install -Dm755 $pkgname/main "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
