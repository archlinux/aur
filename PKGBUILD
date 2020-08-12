pkgname=python-pymc3
pkgver=3.9.3
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://docs.pymc.io"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas' 'python-tqdm' 'python-joblib' 'python-h5py')
optdepends=('python-patsy' 'python-six')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
sha256sums=('4b023a694cb569aaaa4a7268708f9db89a723c7f6baa28023f2f5fabd1384d5c')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

