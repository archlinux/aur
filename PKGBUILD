pkgname=tor-relay-scanner
pkgver=0.0.7
pkgrel=1
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python)
source=($pkgname-$pkgver.pyz::https://github.com/ValdikSS/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.pyz
	tor-relay-scanner)
sha256sums=(	8129d1437ee5114efeff55afb644766957a57baa5d0a22858a5be8ea5133b052
		f7313782f7803ec5faf4fbd25e2259c14994b6e31ef9146d04c24c5680af6f41)

package() {
	install -Dm 755 $pkgname-$pkgver.pyz $pkgdir/usr/bin/$pkgname.pyz
	install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
