# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-ase'
pkgver=3.21.0
_sha=6b8ab0be56c5e42247b711418773474d35002565
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
optdepends=('python-matplotlib: plotting' 'python-flask: for ase.db web-interface')
source=("https://gitlab.com/ase/ase/repository/archive.tar.gz?ref=$pkgver")
md5sums=('a3d0d21847b66207da61d3cc6262b60f')

package() {
    cd "$srcdir/ase-$pkgver-$_sha"
    python setup.py install --root="$pkgdir/" --optimize=1
}
