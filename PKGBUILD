pkgname=openvpn-update-systemd-resolved
pkgver=1.2.6
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('bc60c80af2ed84483fffba1a2a87ec5d3b4f4453c77f9b6e1093f2e65ea0282d')
sha512sums=('a55740011b2dbd3d65f8db615db98888fb48fceb31ad7d0b6eaff28cd1ae381a971d1c7887827de4db3e6d8eac1611ef2ab50c505d674e27e71d9e755dc011b5')

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
