# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyprproxlock
pkgver=0.1.2
pkgrel=1
pkgdesc="A proximity-based daemon for Hyprland that triggers screen locking and unlocking through hyprlock based on Bluetooth device proximity."
arch=(x86_64)
license=(BSD)
url="https://github.com/Da4ndo/hyprproxlock"
conflicts=('hyprproxlock-git' 'hyprproxlock-git-debug')
depends=('bluez-deprecated-tools' 'hyprlock>=0')
source=("https://github.com/Da4ndo/hyprproxlock/archive/refs/tags/0.1.2.tar.gz")
sha256sums=('e6e3eb8983cc614005462333c86f16ca869e56abb6b926bde698d73b735b5a73')

package() {
  install -Dm755 "hyprproxlock" "$pkgdir/usr/bin/hyprproxlock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/hyprproxlock/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/hyprproxlock/README.md"
}