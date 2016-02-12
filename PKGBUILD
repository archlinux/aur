# Maintainer: mar77i <mar77i at mar77i dot ch>
_basepkg=zzzeeksphinx
pkgname="python-$_basepkg"
pkgver=1.0.18
pkgrel=1
pkgdesc="This is zzzeek's own Sphinx layout, used by SQLAlchemy."
arch=(any)
url="https://bitbucket.org/zzzeek/$_basepkg"
license=('MIT')
depends=('python-pyscss' 'python-mako')
source=("https://pypi.python.org/packages/source/${_basepkg:0:1}/$_basepkg/$_basepkg-$pkgver.tar.gz")
sha1sums=(a991c0d72c29bb2d0eda213f3a10db59803652dd)

package() {
  cd "$srcdir/$_basepkg-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
