# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux-secretservice
_gitpkgname=python-proton-keyring-linux-secretservice
pkgver=0.0.1
pkgrel=4
pkgdesc="The proton-keyring-linux-secretservice component."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-keyring-linux-secretservice"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-keyring-linux")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=973d2646ec4d04bc270df53058df892950244e70")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
