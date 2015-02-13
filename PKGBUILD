# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Zhang Li <msfxzi at sina.com>
pkgname=bas
pkgver=2.4
pkgrel=1
pkgdesc="A BASIC interpreter"
arch=(i686 x86_64)
url="http://www.moria.de/~michael/bas/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://www.moria.de/~michael/bas/${pkgname}-${pkgver}.tar.gz")
md5sums=('f2a0c85e5341ae425959413c7e850517')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
