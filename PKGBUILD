# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
pkgname=python-signalslot
pkgver=0.0.11
pkgrel=2
pkgdesc="Simple Signal/Slot implementation"
url="https://github.com/numergy/signalslot"
depends=('python')
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/s/signalslot/signalslot-0.0.11.tar.gz')
md5sums=('b476f74ea97790d694a0f500a7357bb4')

build() {
    cd $srcdir/signalslot-0.0.11
    python setup.py build
}

package() {
    cd $srcdir/signalslot-0.0.11
    python setup.py install --root="$pkgdir" --optimize=1 
}
