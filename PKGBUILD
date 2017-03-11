# Maintainer: mdraw.gh at gmail dot com
pkgname=('elektronn')
pkgver='1.0.13'
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
conflicts=('elektronn-git')
license=('GPLv3')
arch=('any')
source=("https://pypi.org/packages/source/e/elektronn/elektronn-${pkgver}.tar.gz")
md5sums=('9e0dab2edeebc3a9b6962e9c1760b81c')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
