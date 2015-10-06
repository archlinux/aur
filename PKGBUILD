# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-flask-cors
pkgname=python-gcm-clerk
_pkgname=gcm-clerk
pkgver=0.1.6
pkgrel=1
pkgdesc="Python client for Google Cloud Messaging (GCM)"
arch=('any')
url='https://pypi.python.org/pypi/gcm-clerk'
license=('')
depends=('python')
options=(!emptydirs)
        # hhttps://pypi.python.org/packages/source/F/Flask-Cors/Flask-Cors-1.3.1.tar.gz
source=("https://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('eba5994930f65525da06257c66b3cdca')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
