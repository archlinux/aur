# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-networkit
pkgrel=1
pkgver=4.1.1
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython')
license=('MIT')
md5sums=('6745c0ec7a8b22d82daaf5aa2157c950')
sha256sums=('31b142ca9a26c34350042b741e893db60daf0d7e40f3da40d2083a95ef9b7779')

source=('https://algohub.iti.kit.edu/parco/NetworKit/NetworKit/archive/9cfb2d03807de972cb77e138d46046611fb96bd2.zip?subrepos=false')

package() {
  cd "NetworKit-9cfb2d03807d/"
  python setup.py install --root="$pkgdir/"
}
