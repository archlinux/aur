# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-session
pkgver=0.6.7
pkgrel=2
pkgdesc="The proton-vpn-session component provides utility classes to manage VPN sessions."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-session"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('1311efd9e7e9a1010b86afb13653cc7a04d72ee5abf5f569fc6a168e62babf74')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
