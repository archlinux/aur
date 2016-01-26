# Maintainer: mdraw.gh at gmail dot com
pkgname=('elektronn')
pkgver='1.0.6'
pkgrel=1
pkgdesc="A highly configurable toolkit for training 3d/2d CNNs and general Neural Networks"
url="http://www.elektronn.org/"
depends=('python2'
         'python2-numpy'
         'python2-scipy'
         'python2-matplotlib'
         'python2-h5py'
         'python2-theano')
makedepends=('python2-setuptools'
             'cython2')
optdepends=('python2-scikit-learn: For cross-validation')
license=('GPLv3')
arch=('any')
source=("https://pypi.python.org/packages/source/e/elektronn/elektronn-${pkgver}.tar.gz")
md5sums=('558560fcc6952d831b615b53830403ed')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
