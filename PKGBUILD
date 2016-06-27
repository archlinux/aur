# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-networkit
pkgrel=1
pkgver=4.1
pkgdesc='A toolkit for high-performance network analysis'
arch=('i686' 'x86_64')
url='https://networkit.iti.kit.edu/'
depends=('python>=3.4' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-networkx' 'python-tabulate' 'python-powerlaw' 'python-scikit-learn')
makedepends=('scons' 'cython')
license=('MIT')
md5sums=('627df09ecac11aa2b7091baa06a148f0')
sha256sums=('cb69592363bf3f71cf16e5d79871cc813d0abff7d3d97be1ea0260070f9c0a66')

source=('https://algohub.iti.kit.edu/parco/NetworKit/NetworKit/archive/d46285a2c2fbf49b4a9b94acf9666266cd92e677.zip?subrepos=false')

package() {
  cd "NetworKit-d46285a2c2fb/"
  python setup.py install --root="$pkgdir/"
}
