# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.3.1
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('bcd656bbbd487a8a1c680bacea79d4e184a773d37a665cbb8f48904d58142e3576de7b320b5a801952149f6165c9562f4fe1d1526a21889e758ce13e915f78e3'
            'SKIP')

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
