# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tabnetviz
pkgver=1.1.0
pkgrel=1
pkgdesc='Table-based network visualizer'
arch=('any')
url="https://github.com/aszilagyi/tabnetviz"
license=('GPL3')
depends=('python'
         'python-yaml'
         'python-yamlloader'
         'python-pygraphviz'
         'python-pandas'
         'python-matplotlib'
         'python-networkx'
         'python-svgwrite')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aszilagyi/tabnetviz/archive/${pkgver}.tar.gz")
sha256sums=('a8c0c0a5319e25dd2bd3518def5f75384da64787bc7c9c9d6f8793aac67ed729')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}