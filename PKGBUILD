pkgname=tor-relay-scanner
pkgver=0.0.7
pkgrel=2
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python)
source=($pkgname-$pkgver.pyz::https://github.com/ValdikSS/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.pyz
	tor-relay-scanner)
sha256sums=(	8129d1437ee5114efeff55afb644766957a57baa5d0a22858a5be8ea5133b052
		344c4452755a3f8095ed7b41adfbb6fbed66eb0d62ff367da4079b332f30437e)

package() {
	install -Dm 755 $pkgname-$pkgver.pyz $pkgdir/usr/bin/$pkgname.pyz
	install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
