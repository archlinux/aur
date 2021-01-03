# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=wireguard-installer
pkgver=1
pkgrel=1
pkgdesc="WireGuard VPN installer for Linux servers. (Setup: https://stanislas.blog/2019/01/how-to-setup-vpn-server-wireguard-nat-ipv6/)"
arch=('x86_64')
url="https://github.com/angristan/wireguard-install"
license=('MIT')
makedepends=('git' 'curl')
provides=('wireguard')
source=('https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh')
md5sums=('SKIP')

package() {
	curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
	chmod +x wireguard-install.sh
	./wireguard-install.sh
}