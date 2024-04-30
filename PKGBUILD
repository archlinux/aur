# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-logger
pkgver=0.2.1
pkgrel=7
pkgdesc="The proton-vpn-logger is a general purpose logging package for the entire vpn linux client."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-logger"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core")
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
