# Maintainer: Ian Douglas Scott <ian@iandouglasscott.com>
# Contributor: Zhang Li <msfxzi at sina.com>
pkgname=bas
pkgver=2.6
pkgrel=1
pkgdesc="A BASIC interpreter"
arch=(i686 x86_64)
url="http://www.moria.de/~michael/bas/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://www.moria.de/~michael/bas/${pkgname}-${pkgver}.tar.gz")
md5sums=('2a16491fb76ecbb848445b327b01c3ff')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
