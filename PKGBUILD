# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
# Previous Maintainer: Moritz Lipp <mlq@pwmt.org>
_pkgname=Flask-Assets
pkgname=python2-flask-assets
pkgver=0.10
pkgrel=1
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript
files"
arch=(any)
url="http://flask-assets.readthedocs.org"
license=('BSD')
depends=('python2' 'python2-flask')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('897ae9d0e818ea9f6468ffed46afc173')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
