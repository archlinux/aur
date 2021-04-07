# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.2.6
pkgrel=1
pkgdesc='Easily compile a main.cpp file written in C++20'
arch=(any)
url='https://github.com/xyproto/cxx'
license=(MIT)
makedepends=(git)
depends=(scons)
optdepends=('ccache: For faster builds'
            'lldb: For debugging'
            'clang: For clang-format and for clang++'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'wine: For running 64-bit Windows exectuables'
            'valgrind: For tracing calls and profiling'
            'gprof2dot: For visualizing profiling information'
            'graphviz: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information')
source=("git+$url#commit=415a6afa440b1cec6fb7f068a3369e6ae0a0e9de") # tag: 3.2.6
sha256sums=('SKIP')

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}

# getver: github.com/xyproto/cxx/releases
