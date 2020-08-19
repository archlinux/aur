# Maintainer: Faerbit <faerbit at gmail dot com>
# Original author: kalenz <archlinux@kalenz.fr>

pkgname=python2-androguard
pkgver=3.3.5
pkgrel=2
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
depends=("python2" "python2-setuptools" "ipython2<6" "python2-future" "python2-networkx" "python2-pygments" "python2-colorama" "python2-matplotlib" "python2-asn1crypto" "python2-click" "python2-pydot")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('903bd3b46cdd677757227edbd652a455')

package() {
    cd "$srcdir/androguard-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
