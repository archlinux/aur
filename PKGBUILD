pkgname=tor-relay-scanner-bin
pkgver=0.0.9
pkgrel=2
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python)
source=(tor-relay-scanner-$pkgver.pyz::https://github.com/ValdikSS/tor-relay-scanner/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz)
b2sums=(5377ebdca8a70643a212e72c585b19c7397433c3701085db0c42cc8b6dc848144c56990ae028311f59135c7530f4e4d0e05949c2bb22e6a4bff779e96d4b8a75)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
}
