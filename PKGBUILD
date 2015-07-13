# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: T. Jameson Little <t.jameson.little@gmail.com>
pkgname=libudev.so.0
pkgver=0.1.1
pkgrel=2
pkgdesc="Creates /usr/lib/libudev.so.0 -> /usr/lib/libudev.so symlink"
arch=('i686' 'x86_64')
url="http://www.dartlang.org/dartium/"
license=('BSD')
conflicts=('chromium-browser-bin')

package(){
	mkdir -p ${pkgdir}/usr/lib
	ln -s /usr/lib/libudev.so ${pkgdir}/usr/lib/libudev.so.0
}
