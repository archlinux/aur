# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>
pkgname=python-iperf3
pkgver=0.1.11
pkgrel=1
pkgdesc="A python library to interface with the ipef3 command-line tool"
arch=('any')
url="https://github.com/thiezn/iperf3-python"
license=('GPL')
depends=('python' 'iperf3')
source=("https://github.com/thiezn/iperf3-python/archive/v$pkgver.tar.gz")
sha1sums=('6768f369167ee509ce20416be28846fc829a50af')

build() {
    cd $srcdir/iperf3-python-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/iperf3-python-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
