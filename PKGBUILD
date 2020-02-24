# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.3.8
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
sha512sums=('facaafae90540d4aeca61c218d7a33b1c02abdbb49d52a8793e71b240c435acc72ec415f47510fdb897195750b85d049a313f4fcacc0a784706bcd4439b30d61'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
