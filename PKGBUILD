# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=systemd-acpi-nb
pkgver=1.0
pkgrel=2
pkgdesc="Systemd acpi for NB"
arch=('any')
depends=('systemd')
source=("acpi-nb.conf")
sha512sums=("7b2a3ccb8e2f463a2bcbbf8a14c13aed11a6419a2b5ef721594e01faa8f315580b098fcacd9376f7f7c2408e6f259381e43dd904c529ca4bff5eefda5a589f34")

package() {
    install -Dm644 "$srcdir"/acpi-nb.conf "$pkgdir"/etc/systemd/logind.conf.d/acpi-nb.conf
}
