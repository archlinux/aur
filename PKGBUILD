# Maintainer: Crass00 <crass00 @ hotmail . com>
pkgname=python2-backports.ssl_match_hostname
pkgver=3.4.0.2
pkgrel=1
pkgdesc="The ssl.match_hostname() function from Python 3.4"
arch=('any')
url="https://pypi.python.org/pypi/backports.ssl_match_hostname"
license=('GPL-3')
depends=('python2')
makedepends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-$pkgver.tar.gz")
sha256sums=('07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae')
package() {
  cd "$srcdir/backports.ssl_match_hostname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
