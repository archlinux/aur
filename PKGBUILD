pkgname=python-androguard
pkgver=3.3.5
pkgrel=3
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
depends=("python" "python-setuptools" "ipython" "python-future" "python-networkx" "python-pygments" "python-lxml" "python-colorama" "python-matplotlib" "python-asn1crypto" "python-click" "python-pydot")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('903bd3b46cdd677757227edbd652a455')

package() {
    cd "$srcdir/androguard-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

}
