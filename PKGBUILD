# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.2.5
pkgrel=1
pkgdesc='Configuration free build system for easy compilation of C++ executables'
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
source=("git+$url#commit=d6a59e8fae77c1ca9aa80e36ff62f75f6cbb901b") # tag: 3.2.5
sha256sums=('SKIP')

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}

# getver: github.com/xyproto/cxx/releases
