# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-networkit
pkgrel=2
pkgver=4.2
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython' 'ipython')
license=('MIT')
md5sums=('c60c7fc71cee5068d52310eccf3ad77d')
sha256sums=('7ff151da7d5ae691696d2ace501d3210de63dacaaa80e881665fc427375521f7')

source=('https://networkit.iti.kit.edu/uploads/NetworKit.zip')

package() {
  cd "NetworKit/"
  python setup.py install --root="$pkgdir/"
}
