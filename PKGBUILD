# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.3.1
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
source=("git+$url#commit=078fecb99106216878c1d0012c05b6be70aec0e8") # tag: 3.3.1
b2sums=(SKIP)

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}
