# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch-network-manager-wireguard
pkgver=0.1.4
pkgrel=1
pkgdesc="The proton-vpn-killswitch-networ-managerwireguard component is the implementation of the proton-vpn-killswitch interface adapted for Wireguard."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch-network-manager-wireguard"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-vpn-network-manager" "python-proton-vpn-api-core")
makedepends=("git" "python-setuptools")
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
