# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyprproxlock
pkgver=0.1.0
pkgrel=1
pkgdesc="A proximity-based daemon for Hyprland that triggers screen locking and unlocking through hyprlock based on Bluetooth device proximity."
arch=(x86_64)
license=(BSD)
url="https://github.com/Da4ndo/hyprproxlock"
depends=('bluez-deprecated-tools' 'hyprlock>=0')
source=("https://github.com/Da4ndo/hyprproxlock/releases/download/0.1.0/hyprproxlock-0.1.0-linux-x86_64.tar.gz")
sha256sums=('bfc5a5d512137bfb9d58788689793de456cdd74ae40ca98c0af88dfa96bebf59')

package() {
  install -Dm755 "hyprproxlock-linux-x64" "$pkgdir/usr/bin/hyprproxlock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/hyprproxlock/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/hyprproxlock/README.md"
}