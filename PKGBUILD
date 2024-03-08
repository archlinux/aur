# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-core
_gitpkgname=python-proton-core
pkgver=0.1.16
pkgrel=2
pkgdesc="The proton-core component contains core logic used by the other Proton components."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-core"
license=("GPL3")
groups=("ProtonVPN")
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
