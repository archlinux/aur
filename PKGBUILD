# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=yaskkserv2-bin
pkgver=0.1.5
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
sha256sums=('cfda6fb0d673a29dd4d682f9bc6603a73b239f7a898080dcf561107bbf5b5b45')
