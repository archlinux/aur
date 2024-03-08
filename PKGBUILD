# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-logger
_gitpkgname=python-proton-vpn-logger
pkgver=0.2.1
pkgrel=5
pkgdesc="The proton-vpn-logger is a general purpose logging package for the entire vpn linux client."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-logger"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
