# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyprproxlock
pkgver=0.1.0
pkgrel=5
pkgdesc="A proximity-based daemon for Hyprland that triggers screen locking and unlocking through hyprlock based on Bluetooth device proximity."
arch=(x86_64)
license=(BSD)
url="https://github.com/Da4ndo/hyprproxlock"
depends=('bluez-deprecated-tools' 'hyprlock>=0')
source=("https://github.com/Da4ndo/hyprproxlock/releases/download/0.1.0/hyprproxlock-0.1.0-linux-x86_64.tar.gz")
sha256sums=('b39785206a8a460bc238a8eb3b896245f03ccecbb35e3e21f9600f10b302aedd')

package() {
  install -Dm755 "hyprproxlock" "$pkgdir/usr/bin/hyprproxlock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/hyprproxlock/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/hyprproxlock/README.md"
}