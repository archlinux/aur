# Maintainer: Milan Šťastný <milan@statnej.ch>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgbase=glibc-dso
pkgname=(glibc-dso lib32-glibc-dso)
pkgver=2.33
pkgrel=11
arch=(x86_64)
url='https://www.gnu.org/software/libc'
license=(GPL LGPL)

prepare() {
  echo "This package is decomisioned, installing this update will revert to your mainline glibc and should be installed ASAP"
}

package_glibc-dso() {
  pkgdesc='GNU C Library - DSO patch'
  depends=('glibc')
}

package_lib32-glibc-dso() {
  pkgdesc='GNU C Library (32-bit) - DSO patch'
  depends=("lib32-glibc")
}
