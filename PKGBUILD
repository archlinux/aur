# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-networkit
pkgrel=1
pkgver=4.5
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython' 'ipython')
license=('MIT')
md5sums=('9eb1055ca574ef761c56de4ead8871f9')
sha256sums=('d6b127e2d060666b9e0114997589b7d9c28e689d2832a141ae1dc4b4e0b431d0')

source=("https://github.com/kit-parco/networkit/archive/${pkgver}.tar.gz")

package() {
  cd "networkit-${pkgver}"
  python setup.py install --root="$pkgdir/"
}
