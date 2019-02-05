pkgname=python-pymc3
pkgver=3.6
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://docs.pymc.io"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas' 'python-tqdm' 'python-joblib')
optdepends=('python-patsy' 'python-six' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
sha256sums=('eb3a389e68bd1d69c5d4b5d84b730366686059f970d71be74d68266c75e2a6e3')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

