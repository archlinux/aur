# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.1
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/archive/${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig)
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha256sums=('fb21ff23a2e5ceb7b6d923c5fb587278331793cc6904c6a1553a8ab79eb5b390'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
