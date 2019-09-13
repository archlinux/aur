# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.2.6
pkgrel=1
pkgdesc="Archiso configs for building alternate Arch Linux live and install iso images"
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('f54a0ad8b60d80a2f9d571141dcdb4d3d4ad6b2d451bc3331c3edbaa26b5857cf3939c57af7e0f19badcd96f5074bb48fa679f19aad9b942f5a70e5bd6463a27'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
