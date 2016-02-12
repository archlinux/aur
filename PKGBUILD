# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=python-sphinx-paramlinks
pkgver=0.3.1
pkgrel=1
pkgdesc="Allows param links in Sphinx function/method descriptions to be linkable"
arch=(any)
url="https://bitbucket.org/zzzeek/sphinx-paramlinks"
license=('MIT')
depends=('python' 'python-sphinx')
source=(https://pypi.python.org/packages/source/s/sphinx-paramlinks/sphinx-paramlinks-$pkgver.tar.gz)
sha1sums=(8201182841728c97ba5a401a1214b85988935800)

package() {
  cd "$srcdir/sphinx-paramlinks-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


