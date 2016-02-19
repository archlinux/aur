# Maintainer:  Nate Levesque <public at thenaterhood dot com>

pkgname=python-pymlconf
pkgver=0.3.21
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
source=("https://github.com/pylover/pymlconf/archive/02578fb7597f86f99abfd8e29afac991dd67af55.tar.gz")
noextract=()
sha256sums=('823154b454041132a19949e6bb488ef3fba21ed25af7294196841bef53323661')
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
