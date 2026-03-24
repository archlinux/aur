pkgname=ipv4listing
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive IPv4 range generator with validation and safety"
arch=('any')
url="https://github.com/mohitkashyap-code/ipv4listing"
license=('MIT')
depends=('bash')
source=("ipv4listing.sh::https://raw.githubusercontent.com/mohitkashyap-code/ipv4listing/main/ipv4listing.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/ipv4listing.sh" "$pkgdir/usr/bin/ipv4listing"
}
