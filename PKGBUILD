# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-ase'
pkgver=3.20.1
_sha=9610c462e423a3d9f26d6121c88c8cde7b7e0f9c
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
optdepends=('python-matplotlib: plotting' 'python-flask: for ase.db web-interface')
source=("https://gitlab.com/ase/ase/repository/archive.tar.gz?ref=$pkgver")
md5sums=('2e6ec97c1241913a8f27fd8aaa2eb08a')

package() {
    cd "$srcdir/ase-$pkgver-$_sha"
    python setup.py install --root="$pkgdir/" --optimize=1
}
