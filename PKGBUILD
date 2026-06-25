# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=brave-debloater
pkgver=1.2.0
pkgrel=1
pkgdesc="Debloat Brave Browser by disabling AI, Rewards, Wallet, VPN, Telemetry, and other extras."
arch=("any")
url="https://github.com/Anxarden/$pkgname"
license=("MIT")
depends=("brave")
source=("$url/releases/download/v${pkgver}/policies.json")
sha256sums=("50d15acd527fefa79a9519cb685d57baf9f0564a2b192ba16baaa087aa31d611")
install="$pkgname.install"

package() {
  install -Dm0644 -t "${pkgdir}/etc/brave/policies/managed" "./policies.json"
}