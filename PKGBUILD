# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Lone_Wolf <lonewolf AT xs4all DOT nl>

pkgname=systemd-libs-dummy
pkgver=1
pkgrel=1
pkgdesc="systemd client libraries"
url='https://www.github.com/systemd/systemd'
arch=('any')
license=('LGPL2.1')
# this file has no original code at all
provides=('systemd-libs' 'libsystemd' 'libsystemd.so' 'libsystemd.so.0')
conflicts=('systemd-libs' 'libsystemd')
replaces=('libsystemd')

build() {
   echo "Nothing to build"
}

package() {
   mkdir -p ${pkgdir}/usr/lib
   cp -v ${startdir}/libsystemd.so ${pkgdir}/usr/lib
   cp -v ${startdir}/libsystemd.so.0 ${pkgdir}/usr/lib
}
