pkgname=openvpn-update-systemd-resolved
pkgver=1.2.5
pkgrel=2
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("0decae4753d0ad36bb7990252ef21fe34d9ff8d00117e09965f4c98bb2c5e26e")
sha512sums=("8a415d8727e263f5b47aea914d21a6b4fc04be2a956851b9903b5fe4139123368648c1573651a52f149f03e9a776517fc94ca8ba532ea496695cd5c1c17dd03e")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
