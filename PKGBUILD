# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-ase'
pkgver=3.19.1
_sha=0ef71ac51a36007ca631143c0016ba58c55d71a7
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy')
optdepends=('python-matplotlib: plotting' 'python-flask: for ase.db web-interface')
source=("https://gitlab.com/ase/ase/repository/archive.tar.gz?ref=$pkgver")
md5sums=('4ae942961ae3a672ddc679f7fdc410b2')

package() {
    cd "$srcdir/ase-$pkgver-$_sha"
    python setup.py install --root="$pkgdir/" --optimize=1
}
