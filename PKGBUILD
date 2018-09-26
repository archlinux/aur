pkgname=python-pymc3
pkgver=3.5
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://docs.pymc.io"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas')
optdepends=('python-patsy' 'python-joblib' 'python-tqdm' 'python-six' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
sha256sums=('fc81af86aaadbc58b68bdc1fc12e13496b0b7b7d9b8e33f99ba05bc880f4a810')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

