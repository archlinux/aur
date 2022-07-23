# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=mullvad-vpn-dinit
pkgver=1
pkgrel=1
pkgdesc="Dinit service scripts for Mullvad"
arch=('any')
license=('Unlicense')
depends=('mullvad-vpn' 'dinit')
source=("mullvad-vpn")
sha256sums=('b7b10cfd6beccb9dea451814c52adf08db3b6b43957e653f7320d0c779fabf77')
sha512sums=('5e4963445615bb3620ed2b971d231e0f572e6cd0a33af770ff341053d12381218a50cc0f7a01fa0a078e548a39adc5a7b657b381fe2a05f7cea7c104700d3343')

package() {
    install -Dm644 mullvad-vpn "$pkgdir/etc/dinit.d/mullvad-vpn"
}



