
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>

pkgname=2048.c
pkgver=91
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=("https://raw.githubusercontent.com/mevdschee/2048.c/352cb13179edb785141f59cf253caaeb1076f597/2048.c"
		"https://raw.githubusercontent.com/mevdschee/2048.c/352cb13179edb785141f59cf253caaeb1076f597/Makefile")
md5sums=('c4b8e32a3a22db1217cdf448ee69f6a7'
         'd53ad3be6bb1c30be267bfa9ae7185f0')

build() {
	cd "${srcdir}"
	make
}

check() {
	cd "${srcdir}"
	./2048 test
}

package() {
	install "${srcdir}/2048" -D "${pkgdir}/usr/bin/2048"
}

