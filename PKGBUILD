# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Joel Leclerc <lkjoeldev@gmail.com>
# Original Contributor (libudev.so.0): T. Jameson Little <t.jameson.little@gmail.com>

pkgname=lib32-libudev.so.0
pkgver=0.1
pkgrel=1
pkgdesc="Creates /usr/lib32/libudev.so.0 -> /usr/lib32/libudev.so symlink"
arch=('i686' 'x86_64')
url="http://www.dartlang.org/dartium/"
license=('BSD')
depends=(lib32-systemd)

package(){
        mkdir -p ${pkgdir}/usr/lib32
        ln -s /usr/lib32/libudev.so ${pkgdir}/usr/lib32/libudev.so.0
}
