# Maintainer: Rockykln <contact@rockykln.com>
# DEPRECATED: this package has been renamed to podctl-bin to avoid the
# naming collision with the Podman tooling already in the AUR.
# Install podctl-bin instead.

pkgname=pods-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="DEPRECATED — install podctl-bin instead (Linux control suite for AirPods, renamed)"
arch=('any')
url="https://github.com/Rockykln/pods"
license=('MIT' 'Apache-2.0')
depends=('podctl-bin')
provides=()
conflicts=()
source=()
sha256sums=()

package() {
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/${pkgname}/RENAMED" <<'NOTE'
pods-bin has been renamed to podctl-bin.

The Podman ecosystem already occupies the "pods" name on the AUR, which
caused confusion for users searching for one and finding the other. The
new package name follows the Linux *ctl convention (systemctl,
bluetoothctl, journalctl) and makes the purpose clear.

  yay -Rns pods-bin
  yay -S   podctl-bin

This empty stub depends on podctl-bin, so any user who already had
pods-bin installed will pull the real package on the next upgrade.
NOTE
}
