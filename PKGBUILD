# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-imolecule
pkgdesc="View molecules in the IPython notebook"
pkgver=0.2.2
pkgrel=1
url="https://github.com/patrickfuller/imolecule/"
license=('GPL')
arch=('any')
depends=('python') 
source=("https://files.pythonhosted.org/packages/8b/b1/2d1caed44e366d844499fc40220079c46fd9a53d0c01093d82aee48275aa/imolecule-${pkgver}.tar.gz")
md5sums=('0ea55ed3e3feea25812c35e40ef0cd06')


package(){
  cd imolecule-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

