# Maintainer: Nicholas Wong <me@nicho1as.wang>

pkgname=emercoin-bin
pkgver=0.6.3.1
pkgrel=1
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('i686' 'x86_64')    
url="http://emercoin.com/"
license=('GPL3')
source_i686=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux32.tar.gz")
source_x86_64=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux64.tar.gz")
sha256sums_i686=('a395b315c67c5abbb2ffbf75f18dbaf73469ddd32416ed8e2f904b764a55fb8c')
sha256sums_x86_64=('5045f4c20a7060e610847f9ffd01048601266640007e97d9bc245202f59f5ef5')
package() {
    cd "emercoin-0.6.3"
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./bin/emercoind $pkgdir/usr/bin/emercoind
    install -D -m755 ./bin/emercoin-qt $pkgdir/usr/bin/emercoin-qt
    install -D -m755 ./bin/emercoin-tx $pkgdir/usr/bin/emercoin-tx
    install -D -m755 ./bin/emercoin-cli $pkgdir/usr/bin/emercoin-cli
#    install -D -m755 ./bin/test_emercoin $pkgdir/usr/bin/test_emercoin
#    install -D -m755 ./bin/test_emercoin-qt $pkgdir/usr/bin/test_emercoin-qt
    install -D -m755 ./include/bitcoinconsensus.h $pkgdir/usr/include/bitcoinconsensus.h
    install -D -m755 ./lib/libbitcoinconsensus.so $pkgdir/usr/lib/libbitcoinconsensus.so
    install -D -m755 ./lib/libbitcoinconsensus.so.0 $pkgdir/usr/lib/libbitcoinconsensus.so.0
    install -D -m755 ./lib/libbitcoinconsensus.so.0.0.0 $pkgdir/usr/lib/libbitcoinconsensus.so.0.0.0
}
