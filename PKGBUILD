# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-ase'
pkgver=3.18.1
_sha=07de35654601ddbb2b23a4e7df7091696b0af108
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
optdepends=('python-matplotlib: plotting' 'python-flask: for ase.db web-interface')
source=("https://gitlab.com/ase/ase/repository/archive.tar.gz?ref=$pkgver")
md5sums=('bb6a5f658c7b48f92c0e975e274418cd')

package() {
    cd "$srcdir/ase-$pkgver-$_sha"
    python setup.py install --root="$pkgdir/" --optimize=1
}
