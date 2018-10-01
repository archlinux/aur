# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=macchanger-systemd
pkgver=1.0
pkgrel=3
pkgdesc="Systemd unit setting a random address while preserving the original NIC vendor bytes"
arch=('any')
depends=('macchanger')
source=("macspoof.service")
sha512sums=('f9eac10101d963681ab5ba5a131b9d761ac8714ec140579fc744f2b8dda8e2827f46ef258444bdf590d42cb1a1c5ba36d216f239697dfe948f5d4985fb398f74')

package() {
    install -Dm644 "$srcdir"/macspoof.service "$pkgdir"/usr/lib/systemd/system/macspoof@.service
}
