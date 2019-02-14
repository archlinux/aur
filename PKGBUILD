# Maintainer : E5ten <e5ten.arch@gmail.com>

pkgname='scrap'
pkgver=1.1
pkgrel=6
url="https://web.archive.org/web/20130524032130/http://www.math.leidenuniv.nl/~mommen/${pkgname}/"
arch=('x86_64')
pkgdesc="A roguelike game that was written during a period of ten days."
provides=("${pkgname}")
source=("${pkgname}.tar.xz")
sha256sums=('0e8bc30cf201b8fcb490c599e2fdd4dcdf04ac2108e2e3f07102d5092bbce1f7')

build() {
	make
}
package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

