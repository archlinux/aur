pkgname=emercoin
pkgver=0.3.7
pkgrel=1
pkgdesc="Emercoin is a digital currency and blockchain service platform"
arch=('i686')    
url="http://emercoin.com/"
license=('GPL3')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux.tar.gz")
md5sums=('15efd4cfa08a277140027ac2c979e9a1')
package() {
    cd "$pkgname-$pkgver-linux"

    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./bin/32/emercoind $pkgdir/usr/bin/emercoind
    install -D -m755 ./bin/32/emercoin-qt $pkgdir/usr/bin/emercoin-qt
}

                                                
