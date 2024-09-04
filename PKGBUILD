# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.5.1"
pkgrel=5
pkgdesc="Create an on-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=1.5.0" "ldns>=1.7" "wireguard-tools>=1" "jq>=1" "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=("1cc5f23ea6b3ae597055c1650c975cad6cc3112429eecf2d034a70cb1bd1caba7272d94bff36a65b7c228557f74eaec00c151d654d97b3f570a0d28f438c46d1")

package() {
  cd "$pkgname-$pkgver"

  install/install.sh "$pkgdir" "$pkgname"
}
