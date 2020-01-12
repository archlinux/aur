pkgname=pacproxy
pkgver=2.0.2
pkgrel=1
pkgdesc="A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file"
arch=('x86_64')
license=('Apache')
source=(
	"https://github.com/williambailey/$pkgname/releases/download/v$pkgver/pacproxy"_"$pkgver"_"linux_amd64.tar.gz"
)

sha256sums=(
	'8b99b5c3b5a8dbe3531aa694294ece1a981b6c6838fa0322dc37e6d8cc6d2ec6'
)

package() {
	cd "$pkgname"_"$pkgver"_"linux_amd64"
	install -Dm755 $pkgname "$pkgdir/usr/bin/pacproxy"
}
