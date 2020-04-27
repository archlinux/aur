# Maintainer:  Nate Levesque <public at thenaterhood dot com>

pkgname=python-pymlconf
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="Python high level configuration library"
arch=('any')
url="https://github.com/pylover/pymlconf"
license=('MIT')
groups=()
depends=("python"
        "python-yaml")
makedepends=("fakeroot"
        "python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pylover/pymlconf/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('417021da6ba4b8575643e1ba0bfa8d08a02f65663d3983a9dea4fdc477634fdf')
validpgpkeys=()

build() {
        echo "Nothing to build"
}

package() {
        cd $srcdir/pymlconf-$pkgver
        python setup.py install --root="$pkgdir/" --optimize=1
}
