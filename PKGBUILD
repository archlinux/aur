# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=shrinky-intro
pkgver=0.1
pkgrel=3
pkgdesc='Linux 4k intro skeleton (from dnload)'
arch=('x86_64')
url='https://github.com/xyproto/shrinky-intro/'
license=('BSD')
makedepends=('git' 'shrinky')
depends=('libgl' 'sdl2')
#optdepends=('elfkickers: For stripping with sstrip'
#            'vulkan-devel: For Vulkan development')
source=('git+https://github.com/xyproto/shrinky-intro#commit=438ad8b197ff15fb561fe3a0b15d602486e90244')
md5sums=("SKIP")

build() {
  shrinky $pkgname/main.cpp
}

package() {
  install -Dm755 $pkgname/main "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
