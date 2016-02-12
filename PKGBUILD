# Maintainer: mar77i <mar77i at mar77i dot ch>
_basepkg=sphinx-paramlinks
pkgname="python-$_basepkg"
pkgver=0.3.1
pkgrel=1
pkgdesc="Allows param links in Sphinx function/method descriptions to be linkable"
arch=(any)
url="https://bitbucket.org/zzzeek/$_basepkg"
license=('MIT')
depends=('python' 'python-sphinx')
source=(https://pypi.python.org/packages/source/s/$_basepkg/$_basepkg-$pkgver.tar.gz)
sha1sums=(8201182841728c97ba5a401a1214b85988935800)

package() {
  cd "$srcdir/$_basepkg-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


