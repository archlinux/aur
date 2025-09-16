pkgname=svarog
pkgver=1.0
pkgrel=1
pkgdesc="Network Dashboard - Terminal system monitor"
arch=('x86_64')
url="https://github.com/SrWyatt/svarog"
license=('GPL')
depends=('bash' 'coreutils' 'procps' 'iproute2' 'curl' 'iw')
source=('svarog.sh')
sha256sums=('SKIP')  # Cambiar por hash real si quieres seguridad

package() {
    install -Dm755 "$srcdir/svarog.sh" "$pkgdir/usr/bin/svarog"

}
