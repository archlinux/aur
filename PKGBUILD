# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch-network-manager
_gitpkgname=python-proton-vpn-killswitch-network-manager
pkgver=0.2.0
pkgrel=1
pkgdesc="The proton-vpn-killswitch-network-manager component is the implementation of the proton-vpn-killswitch interface using Network Manager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch-network-manager"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-psutil")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
