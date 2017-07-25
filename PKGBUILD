# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-networkit
pkgrel=2
pkgver=4.3
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython' 'ipython')
license=('MIT')
md5sums=('3ece69d5093aabffd7f201bc398d70ce')
sha256sums=('c532043a4a7b4ea0b786d204f3934371ebb3df32a8b91887f39d6b99db98e8d4')

source=("https://github.com/kit-parco/networkit/archive/${pkgver}.tar.gz")

package() {
  cd "networkit-${pkgver}"
  python setup.py install --root="$pkgdir/"
}
