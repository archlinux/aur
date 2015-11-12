# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-networkit
pkgrel=1
pkgver=4.0.1
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython')
license=('MIT')
md5sums=('4eeb1e15bb590c2804fc92f57d567974')
sha256sums=('422f464e389eb4e8b682d8ea38335a29e3af9049a2296c3d9a09b14a25654789')

source=('https://algohub.iti.kit.edu/parco/NetworKit/NetworKit/archive/44250f0d3559cb039b1752f463f63c73c5e7fc84.zip?subrepos=false')

package() {
  cd "NetworKit-44250f0d3559/"
  python setup.py install --root="$pkgdir/"
}
