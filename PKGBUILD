# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
# Co-maintainer: Cedric Girard <girard.cedric@gmail.com>
# Previous Maintainer: Moritz Lipp <mlq@pwmt.org>
_pkgname=Flask-Assets
pkgname=python2-flask-assets
pkgver=0.11
pkgrel=2
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript
files"
arch=(any)
url="http://flask-assets.readthedocs.org"
license=('BSD')
depends=('python2' 'python2-flask' 'python2-webassets')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('d7fa762f704ab5eb62e6801d43ce2300')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
