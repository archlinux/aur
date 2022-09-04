# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=mullvad-vpn-dinit
pkgver=4
pkgrel=1
pkgdesc="Dinit service scripts for Mullvad"
arch=('any')
license=('Unlicense')
depends=('mullvad-vpn' 'dinit')
source=("mullvad-daemon")
sha256sums=('e4674c42ad16da2b34082d0a44819ce10e27aa8b47a502c91883e9d3c5dac5c1')
sha512sums=('313891eb81919854c80ce5f2c759b24d129864b7323586bc0cf16b4c6fbb74a5cbb4b576b587ffb785c537c8635ac2b67ec4994c374acc6d55623d1d8336a3e1')

package() {
    install -Dm644 mullvad-daemon "$pkgdir/etc/dinit.d/mullvad-daemon"
}




