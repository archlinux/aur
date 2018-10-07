pkgname=blackcoin-bin
pkgver=1.2.5.2
pkgrel=2
pkgdesc="BlackCoin is a PoS-based cryptocurrency. Provides blackcoind and blackcoin-qt"
arch=('x86_64')
url="https://blackcoin.org"
license=('MIT')
depends=('gcc-libs')
provides=('blackcoin-qt' 'blackcoind')
source=(https://github.com/CoinBlack/blackcoin/releases/download/v$pkgver/blackcoin-$pkgver-linux.zip)
sha512sums=('c7a49147725941c4202b18d10500e4bb29cd3f40aacbc43d28abf8ea5d1fdda33898a96979409a01ccc4116f49c7ca37654e948bb85dd46b06569970a44a9693')


package() {
	mkdir -p ${pkgdir}/usr/bin
	cp -a ${srcdir}/{blackcoind,blackcoin-qt} ${pkgdir}/usr/bin
}
