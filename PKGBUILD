# Maintainer: Abdelhakim AKODADI <abdelhakim at akodadi dot com>

pkgname=nordvpn-runit
pkgalias=nordvpnd
_realname=nordvpn-runit
pkgdesc="runit service script for nordvpn-bin"
pkgver=3.9.5_1
pkgrel=1
pkgbase=nordvpn-runit
replaces=('nordvpn-runit')
arch=('any')
url='https://aur.archlinux.org/packages/nordvpn-runit'
license=('Apache')
groups=()
depends=('runit' 'nordvpn-bin')
source=('nordvpnd.run')
sha256sums=("cb5b6eda5d086bb9aa64e000f8a5c0c37443dbf3759743f42995f013f61432b3")

package() {
	install -Dm755 nordvpnd.run "$pkgdir"/etc/runit/sv/nordvpnd/run
}
