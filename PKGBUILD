pkgname=python-pymc3
pkgver=3.3
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://pymc-devs.github.io/pymc3/"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas')
optdepends=('python-patsy' 'python-joblib' 'python-tqdm' 'python-six' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
md5sums=('add8d5764f03db6701ae8cea528767d1')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

