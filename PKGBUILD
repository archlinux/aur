# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.2.1
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/archive/${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig)
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha256sums=('b558e48b42a404820a4b792306a9882b80fc5358381e2a5bdf69f1352839c8b0'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
