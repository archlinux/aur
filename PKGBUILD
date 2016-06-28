# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=wavgain
pkgver=1.3.1.3c
pkgrel=1
pkgdesc="Port of mp3gain to ANSI C/C++, extension for RIFF Wave "
arch=('i686' 'x86_64')
url="http://maazl.de/project/mp3/mp3gain.html"
license=('GPL')
source=("http://maazl.de/project/mp3/mp3gain.zip")

md5sums=('617b943d78e0f75041352f1658dfd8d4')

build() {
	cd "${srcdir}/"
	make
}

package() {
	cd "${srcdir}/bin"
	install -Dm0755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
