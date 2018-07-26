# Maintainer: Dictator Mei <dctxmei@gmail.com>
pkgname=macchanger-systemd
pkgver=1.0
pkgrel=1
pkgdesc="systemd unit setting a random address while preserving the original NIC vendor bytes"
arch=('any')
depends=('macchanger')
source=("macspoof.service")
sha512sums=('e479f023cda5ed86a91f070719c4156eb38303c1ab9257607671e29e99ad7d1cf41b8e2e402518c4bc4296c8610f6e7d7ea13b94c215cddce279ba5f43e05bfc')

package() {
    install -Dm644 "$srcdir"/macspoof.service "$pkgdir"/usr/lib/systemd/system/macspoof@.service
}
