# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.4.1
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL')
depends=(snapper)
source=(${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('801bdbeb5a68cfabf369cfb8a4a63562fefa9b1616ab7e4269be154d070f51c40d7c1d751e575fdd663ec11695decd83ae602f0a20355dcdb8fa4e47157c10d0'
            'SKIP')

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
