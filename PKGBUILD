# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=sakemake
pkgver=0.9
pkgrel=1
pkgdesc='Configuration-free build system for C++17 executables'
arch=('x86_64')
url='https://github.com/xyproto/sakemake'
license=('MIT')
makedepends=('git')
depends=('make' 'scons' 'clang' 'gcc' 'pkg-config')
source=("git+https://github.com/xyproto/sakemake#tag=$pkgver")
md5sums=('SKIP')

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}

# vim: ts=2 sw=2 et:
