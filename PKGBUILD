# Maintainer: mdraw.gh at gmail dot com
pkgname=('elektronn')
pkgver='1.0.3'
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
md5sums=('0daa30c96a3d0c3cc73361685537b8f9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
