pkgname=openvpn-update-systemd-resolved
pkgver=1.2.2
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("6f0a94c842d097bcfdc2269303170af83228fa0a7d5d13fb64a2411e3516fb12")
sha512sums=("7322ed2c6894d6807b88e1e11d5a6083742d5c1f8ee257d21868408d8858675aa52f561a4011a59bcdc70cee6fbc92438777e91a2f71adb6f54491f535edbee1")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
