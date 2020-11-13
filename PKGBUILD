# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-imolecule
pkgdesc="View molecules in the IPython notebook"
pkgver=0.1.14
pkgrel=1
url="https://github.com/patrickfuller/imolecule/"
license=('GPL')
arch=('any')
depends=('python') 
source=("https://files.pythonhosted.org/packages/5c/5c/50620b1c0cec515aca6889d187d9773e56d9313d2d2552e19407df9c3342/imolecule-${pkgver}.tar.gz")
md5sums=('d32dea7677750cb1b98ecb1a124bcf24')


package(){
  cd imolecule-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

