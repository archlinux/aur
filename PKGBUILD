# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.3
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('5cc0701d98d7f0bf989fe1592db44801febb34b829486c4c2be7d653eb64bf61f4fed0394a5d65ba86f73810206f803264c8f8835f05d17835617b3c5e00e359'
            'SKIP')

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
