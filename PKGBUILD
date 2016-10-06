pkgname=openvpn-update-systemd-resolved
pkgver=1.2.1
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("8351b90fa4bcd4b43b6892b2e70ebb7ffee8d9aa17a5de349bfb45f974cfaa8c")
sha512sums=("d6702b3f91345cf485a2b937d2fbcc7101eb917f18bd06579eda0e6c6ba228eabe4cab880acc7331441c5ecf26a570d57c70de87572242e849058c118b98688a")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
