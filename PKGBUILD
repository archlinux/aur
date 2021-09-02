# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.3.3"
pkgrel=1
pkgdesc="Create an on-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=0.12.25", "ldns>=1.7", "wireguard-tools>=1", "jq>=1", "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=("ed631d20195f8826816e232f9a473a2bc182c42db6d1150255d344b566d33cf6297147271a5e498628abfd54e3e52b25c68ab3f3e545889410b0ff00e423c0cc")

package() {
  cd "$pkgname-$pkgver"

  install/install.sh "$pkgdir" "$pkgname"
}
