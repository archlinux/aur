pkgname=pacproxy
pkgver=2.0.3
pkgrel=1
pkgdesc="A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file"
arch=('x86_64')
license=('Apache')
source=(
	"https://github.com/williambailey/$pkgname/releases/download/v$pkgver/pacproxy"_"$pkgver"_"linux_amd64.tar.gz"
)

sha256sums=(
	'b8f5d488c13a244e3e927fce3a3f8907e2d9f6b4827ce7ba653005c568dd4a38'
)

package() {
	cd "$pkgname"_"$pkgver"_"linux_amd64"
	install -Dm755 $pkgname "$pkgdir/usr/bin/pacproxy"
}
