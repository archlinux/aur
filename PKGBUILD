# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Lone_Wolf <lonewolf AT xs4all DOT nl>

pkgname=lib32-systemd-dummy
pkgver=1
pkgrel=1
pkgdesc="system and service manager (32-bit version)"
url="https://www.github.com/systemd/systemd"
arch=('any')
license=('GPL2' 'LGPL2.1')
# this file has no original code at all
provides=('lib32-systemd' 'libsystemd.so' 'libsystemd.so.0')
conflicts=('lib32-systemd')

build() {
echo "Nothing to build"
}

package() {
   mkdir -p ${pkgdir}/usr/lib32
   cp -v ${startdir}/libsystemd.so ${pkgdir}/usr/lib32
   cp -v ${startdir}/libsystemd.so.0 ${pkgdir}/usr/lib32
}

