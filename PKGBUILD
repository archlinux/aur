# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-ase'
pkgver=3.22.1
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
optdepends=('python-matplotlib: plotting' 'python-flask: for ase.db web-interface')
source=("https://gitlab.com/ase/ase/-/archive/$pkgver/ase-$pkgver.tar.gz")
md5sums=('0c6fdc046cbd9627f8b74b3f6161178b')

package() {
    cd "$srcdir/ase-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
