pkgname=openvpn-update-systemd-resolved
pkgver=1.1.1
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("e922f27e24ad1e31826f725370eb0a24ff1dc264b02bbc75547600b709bbf65f")
sha512sums=("2e3d4ec91dd18e34c199d1a6b639846ea8773b08a08e8a7ca1546de86192cd9cc694fad34ebeb2f910b88d040ca4dc13678d7c665f99d8e0a2987fc59c6dc88c")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m655 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
