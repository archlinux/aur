# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Lone_Wolf <lonewolf AT xs4all DOT nl>

pkgname=lib32-libffi.so.6
pkgver=1
pkgrel=1
pkgdesc="Portable foreign function interface library (symlink)"
url='https://sourceware.org/libffi/'
arch=('x86_64')
license=('MIT')
# this file has no original code at all
provides=('lib32-libffi.so.6')
conflicts=('lib32-libffi.so.6')

build() {
   echo "Nothing to build"
}

package() {
   mkdir -p ${pkgdir}/usr/lib32
   ln -s /usr/lib32/libffi.so ${pkgdir}/usr/lib32/libffi.so.6
}
