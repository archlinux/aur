# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=1.6.0
pkgrel=2
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python'
         'python-scipy'
         'python-matplotlib'
         'python-numpy'
         'python-traits'
         'python-natsort'
         'python-requests'
         'python-tqdm'
         'python-sympy'
         'python-h5py'
         'python-dateutil'
         'python-dask'
         'python-pint'
         'python-statsmodels'
         'python-numexpr'
         'python-pyaml'
         'python-ptable'
         'python-dill'  # AUR
         'python-ipyparallel'  # AUR
         'python-scikit-image'  # AUR
         'python-sparse'  # AUR
       # 'python-imageio'  # AUR (from scikit-image)
       # 'python-pywavelets' # AUR (from scikit-image)
       # 'python-tifffile'  # AUR (from scikit-image)        
       # 'python-numba'  # AUR (from python-sparse)
       # 'python-llvmlite' # AUR (from python-numba)
         'python-llvmlite-bin' # AUR (from python-numba, but require bin package to avoid version mismatches)
         )

optdepends=('python-scikit-learn: machine learning features'
            'python-hyperspy-gui-ipywidgets: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui: GUI components for desktop'  # AUR
	    'python-blosc: mrcz file support'
            'cython: enables acceleration of certain operations (must be installed at package build time)' )

makedepends=('python-setuptools' )

replaces=('hyperspy')
conflicts=('hyperspy')
provides=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.zip)
sha256sums=('942294a6a6f76ccb55c510ca07293ef93b3fe4eedd37b840b9c88366624b2026')

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

sha256sums=('942294a6a6f76ccb55c510ca07293ef93b3fe4eedd37b840b9c88366624b2026')
