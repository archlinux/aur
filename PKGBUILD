# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.0.6
pkgrel=1
pkgdesc='Build system that makes modern C++ easier to deal with'
arch=(x86_64)
url='https://github.com/xyproto/cxx'
license=(MIT)
makedepends=(git)
depends=(scons)
optdepends=('lldb: For debugging'
            'clang: For clang-format and for clang++'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'wine: For running 64-bit Windows exectuables'
            'valgrind: For tracing calls and profiling'
            'gprof2dot: For visualizing profiling information'
            'graphviz: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information')
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}

# vim: ts=2 sw=2 et:
