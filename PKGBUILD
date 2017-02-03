# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
pkgname=hyperspy
pkgver=1.1.2
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python' 'python-numpy' 'python-matplotlib' 'python-traits' 
         'python-traitsui' 'python-h5py' 'python-scikit-learn' # 'python2-nose' 
         'python-statsmodels' 'ipython' 'python-jinja' 'python-pyzmq'
         'python-pyqt4' 'python-tornado' 'python-sip' 'python2-pygments'
         'python-jsonschema' 'python-dateutil' 'python-scipy' 'python-natsort'
         'ipython-ipyparallel' 'python-dill' 'python-tqdm' 'python-requests'
         'python-sympy')

optdepends=('python-pillow: tiff export'
            'python-seaborn: prettier plotting')

makedepends=('python-setuptools' )

provides=('hyperspy')
conflicts=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.zip)
sha256sums=('0bbea17dea8069c901dfde546449acfa89a9ae23c1a46002d2d8bf231c14fa5e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
