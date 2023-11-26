# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.4.0"
pkgrel=2
pkgdesc="Create an on-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=1.5.0" "ldns>=1.7" "wireguard-tools>=1" "jq>=1" "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=("a4b5362571d16bd5ec615a14f7bcff127bc10796e505d22a0ed6ae5af503512256695e3fb4c7f8b60dd6c5418133f99c96087892108ba7512869529d6ab9aa1f")

package() {
  cd "$pkgname-$pkgver"

  install/install.sh "$pkgdir" "$pkgname"
}
