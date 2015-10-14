# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-networkit
pkgrel=1
pkgver=3.6
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python')
optdepends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons')
license=('MIT')
md5sums=('0c1defc8796f5a30db8c234dfd43859e')
sha256sums=('b83c76135e3379f8d1184015319e0db061675c29e0cad6d50af1aeb3fdd5d492')

source=('https://algohub.iti.kit.edu/parco/NetworKit/NetworKit/archive/71ba57e8f56d007b72f1191b9d02a70110e05ac1.zip?subrepos=true')

package() {
  cd "NetworKit-71ba57e8f56d"
  python setup.py install --root="$pkgdir/"
}
