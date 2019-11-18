# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.3.1
pkgrel=1
pkgdesc="Archiso configs for building Arch Linux live iso with persistent storage support."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('19a607e0bd32667225931bfc06051b773a7a82501e39b5a0afddb3181d6a81eb1dc071ace17052acc4ec1d512be998eba03d466f2342c98384d2d07f399a205a'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
