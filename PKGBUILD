# Maintainer:  Nate Levesque <public at thenaterhood dot com>

pkgname=python-pymlconf
pkgver=0.8.6
pkgrel=1
epoch=
pkgdesc="Python high level configuration library"
arch=('any')
url="https://github.com/pylover/pymlconf"
license=('GPL3')
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
sha256sums=('1ed41f0bf6c82221cf43da8cc46ddc1a27270304e94d03263834120dd1abca7a')
validpgpkeys=()

build() {
        echo "Nothing to build"
}

check() {
        cd $srcdir/pymlconf-02578fb7597f86f99abfd8e29afac991dd67af55
        python setup.py test
}

package() {
        cd $srcdir/pymlconf-02578fb7597f86f99abfd8e29afac991dd67af55
        python setup.py install --root="$pkgdir/" --optimize=1
}
