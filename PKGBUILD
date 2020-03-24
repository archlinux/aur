pkgname=python-pymc3
pkgver=3.8
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://docs.pymc.io"
license=('APACHE')
depends=('python>=3.4' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas' 'python-tqdm' 'python-joblib' 'python-h5py')
optdepends=('python-patsy' 'python-six')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
sha256sums=('c584554c43d095166a2b7cf903e4539942343b4c9ff007066fcfd454454a11dd')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

