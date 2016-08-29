pkgname=openvpn-update-systemd-resolved
pkgver=1.2.0
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("48a41e6499555ace79d332cf7ee7e7d201c9f4d4c6c6a948cad29dde00e7af5a")
sha512sums=("278acae3c7bf5d7b2f3a6c8735479592d28489eaa67b8e2d7ed9e2d2925a93d28e2b77055c519296c184dabce4334f03e864f45d91dabb406a5a7e5d77ac3d96")

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/update-systemd-resolved"
}

# vim:set ts=2 sw=2 et:
