_name=pycallgraph
pkgname=python2-$_name
pkgver=1.0.1
pkgrel=2
pkgdesc="Python module that creates call graph visualizations for Python applications."
arch=('any')
url="http://pycallgraph.slowchop.com/"
license=('GPLv2')
depends=('python2' 'python2-setuptools' 'python2-pygraphviz')
source=("https://github.com/gak/$_name/archive/$pkgver.tar.gz")
md5sums=('b74aa0bb84f53e5d241f5dc16a83f143')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
# vim:set ts=2 sw=2 et:
