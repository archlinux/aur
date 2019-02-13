# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-imolecule
pkgdesc="igraph is a collection of network analysis tools with the emphasis on efficiency, portability and ease of use."
pkgver=0.1.13
pkgrel=1
url="http://igraph.org/python/"
license=('GPL')
arch=('any')
depends=('python') 
source=("https://files.pythonhosted.org/packages/e5/48/0345d404263b2374005472a2665171f94a5e48a49cd5d1e29200e4518625/imolecule-${pkgver}.tar.gz")
md5sums=('262aa6c587b713c5ef425610ee46fca5')


package(){
  cd imolecule-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

