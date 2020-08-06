# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy
pkgver=1.6.0
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python' 'python-scipy' 'python-matplotlib' 'python-numpy'
         'python-traits' 'python-natsort' 'python-requests' 'python-tqdm'
         'python-sympy' 'python-dill' 'python-h5py' 'python-dateutil'
         'ipython-ipyparallel' 'python-dask' 'python-scikit-image'
         'python-pint' 'python-statsmodels' 'python-numexpr' 'python-sparse'
         'python-imageio' 'python-pyaml' 'python-ptable' 'python-tifffile'          
         'python-numba' )

optdepends=('python-scikit-learn: learning'
            'hyperspy-gui-ipywidgets: gui-jupyter'
            'hyperspy-gui-traitsui: gui-traitsui' 
	    'python-blosc: mrcz'
            'cython: speed' )

makedepends=('python-setuptools' )

provides=('hyperspy')
conflicts=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.zip)
sha256sums=('942294a6a6f76ccb55c510ca07293ef93b3fe4eedd37b840b9c88366624b2026')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

