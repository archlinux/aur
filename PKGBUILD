# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
# Co-maintainer: Cedric Girard <girard.cedric@gmail.com>
# Previous Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=python2-flask-assets
_name=Flask-Assets
pkgver=0.12
pkgrel=1
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript
files"
arch=(any)
url="http://flask-assets.readthedocs.org"
license=('BSD')
depends=('python2' 'python2-flask' 'python2-webassets')
makedepends=('python2-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b97b2f2f23517973ac551bde968d7b7e')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
