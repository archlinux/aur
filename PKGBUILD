# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.4.4.3
pkgrel=1
pkgdesc="Templates for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso' 'syslinux')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('123b656709af4135aafa1a5f9da0c1c52a140ef9b8f266d7173ac3c5b8fb7dcf'
            'SKIP')
b2sums=('27f5bf0369ed17fa148c1e39125a4af48b93c82caaa5c0785559ec8f545a5dd1757013f96662b40e3cefdf2de4f0eff17817e2b35979c09edc05c5e307d2ff6c'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
