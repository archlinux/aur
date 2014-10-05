# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Zhang Li <msfxzi at sina.com>
pkgname=bas
pkgver=2.3
pkgrel=1
pkgdesc="A BASIC interpreter"
arch=(i686 x86_64)
url="http://www.moria.de/~michael/bas/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://www.moria.de/~michael/bas/${pkgname}-${pkgver}.tar.gz")
md5sums=('a6f2752790f5ab4a0fd4e6b633db780d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
