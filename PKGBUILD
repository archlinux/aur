# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux-secretservice
pkgver=0.0.1
pkgrel=6
pkgdesc="The proton-keyring-linux-secretservice component."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-keyring-linux-secretservice"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-keyring-linux")
makedepends=("python-setuptools")
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
