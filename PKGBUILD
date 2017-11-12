pkgname=openvpn-update-systemd-resolved
pkgver=1.2.7
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('f9ae161f8b051cf0bca7d4af22886e2c01c76d0c65c4ee86bd7debd837d1af1e')
sha512sums=('57381f085418eda292b03415d7f1f9f9d3fcb4bd0fb1e61f046ecb2b72c146235b272265028125563f4ddc975e6a6d3e2b4c49606ae04680b3c19451125ee55a')

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
