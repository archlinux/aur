# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager-wireguard
pkgver=0.4.1
pkgrel=1
pkgdesc="The proton-vpn-network-manager-wireguard component implements the wireguard VPN protocol using NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager-wireguard"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools" "python-proton-vpn-network-manager")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
