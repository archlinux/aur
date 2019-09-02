# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Zhang Li <msfxzi at sina.com>
pkgname=bas
pkgver=2.5
pkgrel=1
pkgdesc="A BASIC interpreter"
arch=(i686 x86_64)
url="http://www.moria.de/~michael/bas/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://www.moria.de/~michael/bas/${pkgname}-${pkgver}.tar.gz")
md5sums=('d3a0de662f47bb54e7fa79fe1797a42d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
