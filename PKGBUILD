pkgname=psp-cmake
pkgver=0.2
pkgrel=1
arch=(any)
pkgdesc="CMake wrapper for PSP (psp)"
groups=('psp')
depends=('cmake' 'psp-gcc' 'psp-pkg-config')
makedepends=('git')
license=("GPL")
url="https://github.com/pspdev/psplibraries/"
source=("git+https://github.com/pspdev/psplibraries.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"/psplibraries
}

package() {
  cd "$srcdir"/psplibraries/scripts
  sh cmake-toolchain-script.sh "${pkgdir}"
}
