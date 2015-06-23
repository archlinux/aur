# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=sim4
pkgver=2012_10_10
pkgrel=1
pkgdesc="A similarity-based tool for aligning an expressed DNA sequence with a genomic sequence for the gene"
arch=('i686' 'x86_64')
url="http://globin.bx.psu.edu/html/docs/sim4.html"
license=('GPL')
depends=('glibc')
source=("http://globin.bx.psu.edu/dist/sim4/sim4.tar.gz")

build() {
	cd "${srcdir}/sim4.${pkgver//_/-}"
	make
}

package() {
	cd "${srcdir}/sim4.${pkgver//_/-}"
	install -Dm755 sim4 "${pkgdir}/usr/bin/${pkgname}"
}

md5sums=('8bca6eb05c5aaf689db0db12522bdf34')
