# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.3.5
pkgrel=1
pkgdesc="Build your own Arch Linux Live iso image. Features Persistence, Encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('08a0e8866e1ad691cad565de55c118f0caf5a27098a39f9ea4fe3f9e2d4fad353c0213c3f4579185c074936b73aa1b2e5f44f774e2710723227397974274d385'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
