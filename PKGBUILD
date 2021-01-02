# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=civetweb
pkgver="v1.13.r74.g56ff92f0"
pkgrel=1
pkgdesc="C (C/C++) embeddable web server with optional CGI, SSL and Lua support."
arch=(x86_64)
url="https://github.com/civetweb/civetweb"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/civetweb/civetweb.git')
md5sums=('SKIP')

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	sudo make install
}
