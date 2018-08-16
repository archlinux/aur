# Maintainer: Christian Mauderer <oss@c-mauderer.de>
# Package based on python2-flask-assets
pkgname=python-flask-assets
_name=Flask-Assets
pkgver=0.12
pkgrel=1
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript files"
arch=(any)
url="https://pythonhosted.org/Flask-Cache/"
license=('BSD')
depends=('python' 'python-flask' 'python-webassets')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b97b2f2f23517973ac551bde968d7b7e')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
