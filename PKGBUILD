# Maintainer: Hanashiko hlichisper@gmail.com
pkgname=networkmanager-to-iwd
pkgver=1.0
pkgrel=1
pkgdesc="Convert NetworkManager Wi-Fi profiels to iwd-compatible profiles"
arch=('any')
license=('MIT')
depends=('bash')
source=('networkmanager-to-iwd.sh')
sha256sums=('f410ee574545ee1976be483ac1ba52f87ef912f77f8a614a1495cb2f76bda865')
package() {
    install -Dm755 "$srcdir/networkmanager-to-iwd.sh" "$pkgdir/usr/bin/networkmanager-to-iwd"
}
