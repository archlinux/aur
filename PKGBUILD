# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=python-ggplot
pkgver=0.5.8
pkgrel=1
pkgdesc="ggplot for python"
arch=('any')
url="https://github.com/yhat/ggplot/"
license=('BSD')
depends=('python-matplotlib' 'python-statsmodels' 'python-brewer2mpl')
source=("http://pypi.python.org/packages/source/g/ggplot/ggplot-${pkgver}.tar.gz")


build() {
    cd "$srcdir/ggplot-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ggplot-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('3348596865bdb3d654c0fc3823c43cfaa660a145a6b38428b5d846da84ae3096')
