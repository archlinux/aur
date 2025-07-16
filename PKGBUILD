# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgname=mullvad-vpn-dinit
pkgver=6
pkgrel=1
pkgdesc="Dinit service scripts for Mullvad"
arch=('any')
license=('Unlicense')
depends=('mullvad-vpn' 'dinit')
source=("mullvad-daemon")
sha256sums=('5922c40e853e3b82a9a2231b1b4692204c6ccfd13044d51aa3d9de30f1fc3770')

package() {
    install -Dm644 mullvad-daemon "$pkgdir/etc/dinit.d/mullvad-daemon"
}

