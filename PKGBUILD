# Maintainer: Daniel Langbein <daniel@systemli.org>

pkgname="riseup-vpn-terminal"
pkgver=0.0.2
pkgrel=1
pkgdesc="Bash script to start Riseup VPN on a terminal"
arch=('any')
license=('MIT')


depends=('riseup-vpn')
# Fix for issue 374
# https://0xacab.org/leap/bitmask-vpn/-/issues/374
depends+=('lxqt-policykit')

makedepends=('git')  # to fetch source(s) via git
source=("riseup-vpn-terminal")
sha256sums=('b6e126c2ddfd10721acb9e1f7dd028ffc66efa194e21690ca2ed2012e7d54909')

package() {
    install -Dm0555 riseup-vpn-terminal "$pkgdir"/usr/bin/riseup-vpn-terminal
}
