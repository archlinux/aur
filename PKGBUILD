# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-connection
_gitpkgname=python-proton-vpn-connection
pkgver=0.11.3
pkgrel=1
pkgdesc="The proton-vpn-connection component defines the interface that VPN connection backends should implement."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-connection"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=6c6b13cd641c9c890f88690853cf52b6db918723")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
