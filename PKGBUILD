# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch-network-manager
pkgver=0.5.4
pkgrel=1
pkgdesc="The proton-vpn-killswitch-network-manager component is the implementation of the proton-vpn-killswitch interface using Network Manager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch-network-manager"
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
