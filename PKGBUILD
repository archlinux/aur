# Maintainer:  Nate Levesque <public at thenaterhood dot com>

pkgname=python-pymlconf
pkgver=0.3.20
pkgrel=1
epoch=
pkgdesc="Python high level configuration library"
arch=('any')
url="https://github.com/pylover/pymlconf"
license=('custom')
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
source=("https://pypi.python.org/packages/source/p/pymlconf/pymlconf-0.3.20.tar.gz")
noextract=()
sha256sums=('084db90a5bba1002e340e88a8bc52d7b71dc69b93572a47adee1651d230b2a42')
validpgpkeys=()

prepare() {
        cd $srcdir/pymlconf-$pkgver
}

build() {
        echo "Nothing to build"
}

check() {
        cd $srcdir/pymlconf-$pkgver
        python setup.py test
}

package() {
        cd $srcdir/pymlconf-$pkgver
        python setup.py install --root="$pkgdir/" --optimize=1
}
