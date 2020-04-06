# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.4
pkgrel=1
pkgdesc="Build your own Arch Linux Live iso image. Featuring Persistence, Encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
install=archuseriso.install
license=('GPL')
depends=('archiso')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('dafef1238d4db9e513063c6ec9ca695dfa24bfa4b8b7a28ff0e952ca6632c0e68377d24d60bed57919019a54c4a558c8eb6365b2e96e7dde2c006c65442298e6'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
