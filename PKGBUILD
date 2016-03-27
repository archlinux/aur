# Former Maintainer: Ishan Arora <ishanarora@gmail.com>
# Maintainer: Kyle Terrien <kyleterrien@gmail.com>

pkgname=python-deap
pkgver=1.0.2
pkgrel=1
pkgdesc="Distributed Evolutionary Algorithms in Python"
arch=('any')
url="https://github.com/DEAP/deap"
license=('LGPL')
depends=('python')
source=("https://pypi.python.org/packages/source/d/deap/deap-$pkgver.post2.tar.gz")
optdepends=("python-numpy: for CMA-ES" "python-matplotlib: for visualization" "python-scoop: for computation distribution")
md5sums=('ccf5ed7562e4d6236c9416e3b5a9d941')

package() {
  cd "$srcdir/deap-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
