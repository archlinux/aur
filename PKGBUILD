pkgname=openvpn-update-systemd-resolved
pkgver=1.1.0
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
sha256sums=("c10e345108af772282292c764f163e6c954a2fec3e403f3933f0cb1f987c7317")
sha512sums=("18d910efc568b85f78ad3cbdd8c241fc42ff7dd8bb71d39e6b66025c274260780f8d14ef20111a31f4df80365d7b12ecb063866f6f9af7695c78dbf8f2292f8d")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m655 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
