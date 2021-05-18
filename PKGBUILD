# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.2.8
pkgrel=1
pkgdesc='Easily compile a main.cpp file written in C++20'
arch=(any)
url='https://github.com/xyproto/cxx'
license=(MIT)
makedepends=(git)
depends=(scons)
optdepends=('ccache: For faster builds'
            'clang: For clang-format and for clang++'
            'graphviz: For visualizing profiling information'
            'gprof2dot: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information'
            'lldb: For debugging'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'valgrind: For tracing calls and profiling'
            'wine: For running 64-bit Windows exectuables')
source=("git+$url#commit=dcb95022c4deb4d70ca1ca4d9050eff535a54eb1") # tag: 3.2.8
b2sums=('SKIP')

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}
