pkgname=deer
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple system fetch script with ASCII art"
arch=('any')
license=('MIT')
depends=('bash' 'coreutils' 'grep' 'sed' 'procps-ng' 'pciutils')
source=("deer")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/deer" "$pkgdir/usr/bin/deer"
}
