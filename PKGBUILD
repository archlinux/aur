pkgname=emercoin
pkgver=0.6.1
pkgrel=1
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('i686' 'x86_64')    
url="http://emercoin.com/"
license=('GPL3')
source_i686=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux32.tar.gz")
source_x86_64=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux64.tar.gz")
md5sums_i686=('ea60601125d72f8a52ba14209a328bbc')
md5sums_x86_64=('b108ceb3ee3fc97a98c34f06b0dde918')
package() {
    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./bin/emercoind $pkgdir/usr/bin/emercoind
    install -D -m755 ./bin/emercoin-qt $pkgdir/usr/bin/emercoin-qt
    install -D -m755 ./bin/emercoin-tx $pkgdir/usr/bin/emercoin-tx
    install -D -m755 ./bin/emercoin-cli $pkgdir/usr/bin/emercoin-cli
    install -D -m755 ./bin/test_emercoin $pkgdir/usr/bin/test_emercoin
    install -D -m755 ./bin/test_emercoin-qt $pkgdir/usr/bin/test_emercoin-qt
    install -D -m755 ./include/bitcoinconsensus.h $pkgdir/usr/include/bitcoinconsensus.h
    install -D -m755 ./lib/libbitcoinconsensus.so $pkgdir/usr/lib/libbitcoinconsensus.so
    install -D -m755 ./lib/libbitcoinconsensus.so.0 $pkgdir/usr/lib/libbitcoinconsensus.so.0
    install -D -m755 ./lib/libbitcoinconsensus.so.0.0.0 $pkgdir/usr/lib/libbitcoinconsensus.so.0.0.0
}
