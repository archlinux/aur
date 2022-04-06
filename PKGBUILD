# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.3.2
pkgrel=1
pkgdesc='Compile C++ code by detecting flags and includes automatically'
arch=(any)
url='https://github.com/xyproto/cxx'
license=(BSD)
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
source=("git+$url#commit=04089a3162e1aa184970dea1336c4f73ba9fe738") # tag: 3.3.2
b2sums=(SKIP)

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}
