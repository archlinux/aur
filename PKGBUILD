# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.5.0
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('6e0e21b40555cbc1725f2fde96fa7705c160d856ae67f84107ad889896314694')

build() {
  cd "${srcdir}"/probability-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/probability-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
