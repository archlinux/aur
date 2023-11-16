# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-connection
_gitpkgname=python-proton-vpn-connection
pkgver=0.11.0
pkgrel=4
pkgdesc="The proton-vpn-connection component defines the interface that VPN connection backends should implement."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-connection"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=747ccacb5350ad59f2a09953b8d20c5c161aab54")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
