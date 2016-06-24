# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=argparser-doc
pkgver=5.1
pkgrel=1
pkgdesc="Command line argument parser library, like getopt, except better. Documentation."
arch=('any')
url="https://github.com/maandree/argparser"
license=('FDL1.3')
makedepends=('coreutils' 'sed' 'texinfo')
install=argparser.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('10cbff3d7c17d5c8e99dab20e5b425e1da7625dd4090d6c904c944b8bb64195f')


build() {
	cd "${srcdir}/argparser-${pkgver}"
	make DESTDIR="$pkgdir" doc
}

package() {
	cd "${srcdir}/argparser-${pkgver}"
	make DESTDIR="$pkgdir" install-doc
}

