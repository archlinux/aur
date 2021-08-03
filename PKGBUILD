# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.3.0
pkgrel=1
pkgdesc='Compile C++ code by detecting flags and includes automatically'
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
source=("git+$url#commit=bac4780e070d7168a44e9f4ce596d27614eda02e") # tag: 3.3.0
b2sums=(SKIP)

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}
