pkgname=pacproxy
pkgver=2.0.4
pkgrel=1
pkgdesc='A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file'
arch=(x86_64)
license=(Apache)
source=($pkgname\_$pkgver\_linux_amd64.tar.gz::https://github.com/williambailey/$pkgname/releases/download/v.$pkgver/$pkgname\_$pkgver\_linux_amd64.tar.gz)
sha256sums=(e0836759847a0e69c3625f1fcd87fc324a19f5fb98771ab8da2e545ca82e4975)

package() {
	install -Dm 755 $pkgname\_$pkgver\_linux_amd64/$pkgname $pkgdir/usr/bin/$pkgname
}
