pkgname=openvpn-update-systemd-resolved
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
sha256sums=("ba3471acade86b257032b7ce4190af36016355a9fffd507b65e886e3aec3d115")
sha512sums=("b8d44792c1d1aa061ea574dd379088e75fb29d8b26897042c79ca6ac6d56c2324cc7467a12df0f52bfcd0599b3cb61beecb3d5fd88fb2b1d8d3384498a74ce1e")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m655 update-systemd-resolved "${pkgdir}/etc/openvpn/update-system-resolved"
}

# vim:set ts=2 sw=2 et:
