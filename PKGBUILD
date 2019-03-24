# Maintainer: Faerbit <faerbit at gmail dot com>
# Original author: kalenz <archlinux@kalenz.fr>

pkgname=("python2-androguard" python-androguard)
pkgbase=python2-androguard
pkgver=3.3.5
pkgrel=2
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('903bd3b46cdd677757227edbd652a455')

package_python2-androguard() {
    depends=("python2" "python2-setuptools" "ipython2<6" "python2-future" "python2-networkx" "python2-pygments" "python2-colorama" "python2-matplotlib" "python2-asn1crypto" "python2-click" "python2-pydot")
    cd "$srcdir/androguard-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-androguard() {
    depends=("python" "python-setuptools" "ipython" "python-future" "python-networkx" "python-pygments" "python-lxml" "python-colorama" "python-matplotlib" "python-asn1crypto" "python-click" "python-pydot")
    cd "$srcdir/androguard-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

}
