# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.4.4.1
pkgrel=1
pkgdesc="Templates for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso' 'syslinux')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('f6f83b488771672cda0dc2fdbaf09666a386cde7049292ba1795fe6112bacd48'
            'SKIP')
b2sums=('afde8cc75306cf85cc04439afee1c53e81138f03d4ebecb14e62815d2346430e10667d7291534b37336354c980368e66567d3d99b130fcc5d98eafd03d63c058'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
