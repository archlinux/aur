pkgname=tor-relay-scanner-bin
pkgver=0.0.9
pkgrel=1
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python)
source=(tor-relay-scanner-$pkgver.pyz::https://github.com/ValdikSS/tor-relay-scanner/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	tor-relay-scanner)
sha256sums=(	cbf28681783d19972df7784509a592479ce1cc2beba6bc666a5f5db411306cce
		ad10d3137f2032dd18a1215778ad245af36c919a6b93ab435990194e728ed6b6)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner.pyz
	install -Dm 755 tor-relay-scanner $pkgdir/usr/bin/tor-relay-scanner
}
