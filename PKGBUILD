# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Lone_Wolf <lonewolf AT xs4all DOT nl>

pkgname=lib32-libsdl2-2.0.so.0-symlink
pkgver=1
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (symlink)"
url='https://www.libsdl.org'
arch=('x86_64')
license=('MIT')
# this file has no original code at all
provides=('lib32-libSDL2-2.0.so.0')
conflicts=('lib32-libSDL2-2.0.so.0')

build() {
   echo "Nothing to build"
}

package() {
   mkdir -p ${pkgdir}/usr/lib32
   ln -s /usr/lib32/libSDL2-2.0.so ${pkgdir}/usr/lib32/libSDL2-2.0.so.0
}
