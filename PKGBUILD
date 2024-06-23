# Maintainer: Nathan Williams <nathanwilliams@utexas.edu>
pkgname=slowcgi-portable-git
pkgver=7.2
pkgrel=1
pkgdesc='Run CGI scripts on FastCGI webservers. A port from OpenBSD.'
arch=('any')
license=('ISC')
source=('git+https://github.com/adaugherity/slowcgi-portable')
sha256sums=('SKIP')

# Patching handled by makefile. No need for prepare()

build() {
	cd slowcgi-portable
	make
}

package() {
	cd slowcgi-portable
	sudo make install prefix=/usr mandir=/usr/share/man
}
