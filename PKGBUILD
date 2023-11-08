# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-session
_gitpkgname=python-proton-vpn-session
pkgver=0.6.2
pkgrel=3
pkgdesc="The proton-vpn-session component provides utility classes to manage VPN sessions."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-session"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("python-setuptools")
#source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=${pkgver}")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=419b25bd1823f78d1219dc4cc441eeaf37646068")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
