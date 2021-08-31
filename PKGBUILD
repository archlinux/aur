# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.3.1"
pkgrel=1
pkgdesc="Create an on-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=0.12.25", "ldns>=1.7", "wireguard-tools>=1", "jq>=1", "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=("56735e773be7b2dd495afedfab01a230c155dbc12eb6cdce2e6b5ca3bf256ea64beec25518e33f1150b712521d2b8c3b246da59d5ceb87e815a80d4deff37e92")

package() {
  cd "$pkgname-$pkgver"

  install/install.sh "$pkgdir" "$pkgname"
}
