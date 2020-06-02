# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy
pkgver=1.5.2
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
         )

optdepends=('python-pillow: tiff export'
            'python-seaborn: prettier plotting')

makedepends=('python-setuptools' )

provides=('hyperspy')
conflicts=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.zip)
sha256sums=('fd326d22be987038b2415d7886c39199569235d92aa2d6167c539a4dce125358')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

