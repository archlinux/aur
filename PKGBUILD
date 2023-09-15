# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=yaskkserv2-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Yet Another SKK server rewritten in rust"
arch=('x86_64')
url="https://github.com/wachikun/yaskkserv2"
license=('Apache License 2.0' 'MIT')
source=("https://github.com/wachikun/yaskkserv2/releases/download/$pkgver/yaskkserv2-$pkgver-$arch-unknown-linux-gnu.tar.gz")

package() {
	cd "yaskkserv2-$pkgver-$arch-unknown-linux-gnu"
        install -Dm755 yaskkserv2_make_dictionary $pkgdir/usr/bin/yaskkserv2_make_dictionary
        install -Dm755 yaskkserv2 $pkgdir/usr/bin/yaskkserv2
        install -D -m644 LICENSE-APACHE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE
        install -D -m644 LICENSE-MIT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT
}
sha256sums=('db73a9b1e924c9496399b483f2975a394f06aa9c175c817b01fe50aeba6a634e')
