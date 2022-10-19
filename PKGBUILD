# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=mullvad-vpn-dinit
pkgver=5
pkgrel=1
pkgdesc="Dinit service scripts for Mullvad"
arch=('any')
license=('Unlicense')
depends=('mullvad-vpn' 'dinit')
source=("mullvad-daemon")
sha256sums=('5922c40e853e3b82a9a2231b1b4692204c6ccfd13044d51aa3d9de30f1fc3770')
sha512sums=('e4c843a7e3711760facbac6bfc365f31e4c71b7b79d49230f8a90e9a87665e8e98087fc7a6774fec6c2d1ba2bf9eedc061cb6262e480e74dc5d5dac591a7e03d')

package() {
    install -Dm644 mullvad-daemon "$pkgdir/etc/dinit.d/mullvad-daemon"
}




