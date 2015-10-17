# Maintainer: Swift Geek
pkgname=python-blogofile-blog
_pipname=blogofile_blog
pkgver=0.8.3
pkgrel=1
pkgdesc="A static website compiler and blog engine"
arch=('any')
url="http://www.blogofile.com/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/b/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('a93b7d81507b134913f5237f4f1f9b71')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
