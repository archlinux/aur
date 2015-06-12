# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=port-trigger
pkgver=2
pkgrel=1
pkgdesc="Run programs when someone makes a connection to a specific port"
arch=('any')
url="https://github.com/maandree/port-trigger"
license=('GPL3')
depends=('java-runtime')
makedepends=('sed' 'java-environment' 'texinfo')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('57dbcee8065bc15c6d0cb6042c36f08b61256166e0b18e63283a167b02e7c083')


build() {
	cd "${srcdir}/port-trigger-${pkgver}"
	make DESTDIR="$pkgdir"
}

package() {
	cd "${srcdir}/port-trigger-${pkgver}"
	make DESTDIR="$pkgdir" install
}

