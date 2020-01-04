# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.3.6.1
pkgrel=1
pkgdesc="Build your own Arch Linux Live iso image. Features Persistence, Encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('39deab662754751d3c57b284fea3f7169dcb1dd84e9df6447ca87bc53d2f81177cc6fe2c177242e154d93a04a554999831b8277fd443cec76d8214b5bc3a8259'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
