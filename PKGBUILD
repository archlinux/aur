# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-jgraph
pkgname=('python-jgraph')
pkgver='0.2.1'
pkgrel='4'
pkgdesc="View graph data structures in the IPython notebook"
arch=('any')
url="http://patrick-fuller.com/jgraph/"
license=('MIT')
source=("https://pypi.python.org/packages/3.4/j/jgraph/jgraph-${pkgver}-py2.py3-none-any.whl")
md5sums=('75a2f7347e0b00631cb360d2f2c2dbc5')
makedepends=('python-pip')

package_python-jgraph(){
  depends=('python'
           'ipython')
  pip install --no-deps --target "${pkgdir}/usr/lib/python3.7/site-packages" "jgraph-${pkgver}-py2.py3-none-any.whl"
}

# vim: ts=2 sw=2 et
