pkgname=pacproxy
pkgver=2.0.5
pkgrel=1
pkgdesc='A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file'
arch=(x86_64)
license=(Apache)
source=($pkgname\_$pkgver\_linux_amd64.tar.gz::https://github.com/williambailey/$pkgname/releases/download/v$pkgver/$pkgname\_$pkgver\_linux_amd64.tar.gz)
sha256sums=(b14cdb39e4c791776c19cd5b0e626bd892a3cfc2876141d77b24c1919e29cc39)

package() {
	install -Dm 755 $pkgname\_$pkgver\_linux_amd64/$pkgname $pkgdir/usr/bin/$pkgname
}
