pkgname=python-pymc3
pkgver=3.1
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://pymc-devs.github.io/pymc3/"
license=('APACHE')
depends=('python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas')
options=(!emptydirs)
source=("https://github.com/pymc-devs/pymc3/archive/v${pkgver}.tar.gz")
md5sums=('29147e78a9474da23db932ffb0085af2')

package() {
  cd "$srcdir/pymc3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

