# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=openvpn-installer
pkgver=1
pkgrel=1
pkgdesc="Set up your own OpenVPN server on Debian, Ubuntu, Fedora, CentOS or Arch Linux. "
arch=('x86_64')
url="https://github.com/angristan/openvpn-install"
license=('MIT')
makedepends=('git' 'curl')
provides=('openvpn')
source=('https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh')
md5sums=('SKIP')

package() {
	curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
	chmod +x openvpn-install.sh
	./openvpn-install.sh
}
