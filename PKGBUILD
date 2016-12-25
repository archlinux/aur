pkgname=openvpn-update-systemd-resolved
pkgver=1.2.3
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("697d4492b9ad1501fb35219fa8d1c05266238f1ea666cf79ef79b78c8081f8a1")
sha512sums=("d014106960c6e83737ac0bad7547eca1037a6ad9aa770c6cd9805a9287ae24adaf1b2b2f213659d4e46e9ce1605482a34a54d3dcf734332af9c83f007ef404e6")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
