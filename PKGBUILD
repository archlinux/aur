# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyprproxlock
pkgver=0.1.1
pkgrel=1
pkgdesc="A proximity-based daemon for Hyprland that triggers screen locking and unlocking through hyprlock based on Bluetooth device proximity."
arch=(x86_64)
license=(BSD)
url="https://github.com/Da4ndo/hyprproxlock"
conflicts=('hyprproxlock-git' 'hyprproxlock-git-debug')
depends=('bluez-deprecated-tools' 'hyprlock>=0')
source=("https://github.com/Da4ndo/hyprproxlock/releases/download/0.1.1/hyprproxlock-0.1.1-linux-x86_64.tar.gz")
sha256sums=('6e7a9d116896678501f4bd25679758d8f1e9e48ea475d8d7866e61defea9f4e1')

package() {
  install -Dm755 "hyprproxlock" "$pkgdir/usr/bin/hyprproxlock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/hyprproxlock/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/hyprproxlock/README.md"
}