# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.4
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('1e3b9cd708e491072e5d780cd7380ddb508ecbb252fdac8a816b2cc033cc04997ea9064e59d577d18c97797c912007df0df989b0708b376f924648d0728e7659'
            'SKIP')

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
