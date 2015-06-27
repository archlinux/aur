# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
pkgname=python-signalslot
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple Signal/Slot implementation"
url="https://github.com/numergy/signalslot"
depends=('python')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/signalslot/signalslot-$pkgver.tar.gz")
md5sums=('7be2c3e6d1bb932c11f4963701322c8a')

build() {
    cd $srcdir/signalslot-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/signalslot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
