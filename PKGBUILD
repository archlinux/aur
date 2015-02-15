# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=python-ggplot
pkgver=0.6.5
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

sha256sums=('7922152c5986b12da4f663ac6905b6b8ce51a66b9cabf2671a2be3906784ee41')
