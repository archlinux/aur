pkgname=blackcoin-bin
pkgver=1.2.5.2
pkgrel=1
pkgdesc="BlackCoin is a PoS-based cryptocurrency. Provides blackcoind and blackcoin-qt"
arch=('x86_64')
url="https://blackcoin.org"
license=('MIT')
depends=('gcc-libs')
provides=('blackcoin-qt' 'blackcoind')
source=(https://github.com/CoinBlack/blackcoin/releases/download/v$pkgver/blackcoin-$pkgver-linux.zip)
sha512sums=('9d9d3a3cd034ed9d2091bdb24ef59a35e423b85d7fb76d42238be724e101295a7e78987648c3909a45ec29f24dc1cec7387015e6e8377ddf1a854cb9df0033ae')


package() {
	mkdir -p ${pkgdir}/usr/bin
	cp -a ${srcdir}/{blackcoind,blackcoin-qt} ${pkgdir}/usr/bin
}
