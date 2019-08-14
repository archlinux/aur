pkgname=python-pymc3
pkgver=3.7
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://docs.pymc.io"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas' 'python-tqdm' 'python-joblib')
optdepends=('python-patsy' 'python-six' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
sha256sums=('5330fa7b9be470c4d8f3fffe23fc8e0bcdeb0b281bedcd765f1e9579b43865e6')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

