# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=caddy-runit
pkgver=20240310
pkgrel=1
pkgdesc="Runit service script for caddy."
arch=("any")
url="https://caddyserver.com"
license=("Apache")
depends=("caddy" "runit")
source=("caddy.run" "caddy.log.run")
sha256sums=("5956545d811e5717b399a1aebbdb56b40b6bc91c5a4aa4941aadd4021fb828b9"
            "60ddee879d69c49eb0193d8636716dcbc37ea9bc1ebecc29c808c7d6a3201057")

package() {
	cd "$srcdir"
	install -Dm755 caddy.run "$pkgdir/etc/runit/sv/caddy/run"
	install -Dm755 caddy.log.run "$pkgdir/etc/runit/sv/caddy/log/run"
}
