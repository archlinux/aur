# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.4.2
pkgrel=1
pkgdesc="Templates for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso' 'syslinux')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('0ebcbff5a27ffed6e3cab83da70c0767f7d5e11d7052305f25899de48efe7e0424fd61e967df6d755bf08f671354e27fc6cc4dcb4c1be1f4ac596d9ff41b9ee7'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
