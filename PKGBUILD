# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-networkit
pkgrel=1
pkgver=4.2
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython')
license=('MIT')
md5sums=('9d57c00fb7ee2cc81a8850fa7149d220')
sha256sums=('b236f07a6be9fece0681fc7be3fdc8b2e43e70f3577b2468c571d5a2ccc847d8')

source=('https://algohub.iti.kit.edu/parco/NetworKit/NetworKit/archive/95568e2770234df4afd0e9fc25f9e4f3fd73cadf.zip?subrepos=false')

package() {
  cd "NetworKit-95568e277023/"
  python setup.py install --root="$pkgdir/"
}
