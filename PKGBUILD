# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-jgraph
pkgname=('python-jgraph'
	 'python2-jgraph')
pkgdesc="View graph data structures in the IPython notebook"
pkgver=0.2.1
pkgrel=1
url="http://patrick-fuller.com/jgraph/"
license=('MIT')
arch=('any')
depends=('python'
	 'ipython') 
source=("https://pypi.python.org/packages/3.4/j/jgraph/jgraph-${pkgver}-py2.py3-none-any.whl")
md5sums=('75a2f7347e0b00631cb360d2f2c2dbc5')

package_python-jgraph(){
	makedepends=('python-pip')
	depends=('python'
         	 'ipython')
	 pip install --no-deps --target "${pkgdir}/usr/lib/python3.5/site-packages" "jgraph-${pkgver}-py2.py3-none-any.whl"
}

package_python2-jgraph(){
 	makedepends=('python2-pip')	
	depends=('python2'
	         'ipython2')
	pip2 install --no-deps --target "${pkgdir}/usr/lib/python2.7/site-packages" "jgraph-${pkgver}-py2.py3-none-any.whl"	 
}


