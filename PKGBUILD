# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=sakemake
pkgver=1.18
pkgrel=1
pkgdesc='Configuration-free build system for C++17 executables'
arch=('x86_64')
url='https://github.com/xyproto/sakemake'
license=('MIT')
makedepends=('git')
depends=('scons')
optdepends=('clang: For compiling C++17 projects with clang++')
source=("git+https://github.com/xyproto/sakemake#tag=$pkgver")
md5sums=('SKIP')

package() {
  pkgdir="$pkgdir" make -C "$pkgname" pkg
}

# vim: ts=2 sw=2 et:
