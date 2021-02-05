# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.3.0"
pkgrel=1
pkgdesc="Create an on-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=0.12.25", "ldns>=1.7", "wireguard-tools>=1", "jq>=1", "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=("57a7bb28b8c90accf88c6d3f2c88cc5d5b3f47ab85e35d94aa68597a2c0386bb7a4a17232c81cede7f4bde584b482d97b284e0a67f5e806a0e1fa6f06aa7fbf5")

package() {
  cd "$pkgname-$pkgver"

  install/install.sh "$pkgdir" "$pkgname"
}
