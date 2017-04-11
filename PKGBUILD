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
md5sums=('9faabecd3077012c7838fe42da7d49e9')
sha256sums=('e53f72e01260a4d857227f0a6aa919223d0b515dd373203205bb33b47956891f')

source=("https://github.com/kit-parco/networkit/archive/${pkgver}.tar.gz")

package() {
  cd "networkit-${pkgver}"
  python setup.py install --root="$pkgdir/"
}
