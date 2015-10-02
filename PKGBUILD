# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=python2-pilkit
_pkgname=pilkit
pkgver=1.1.13
pkgrel=1
pkgdesc="A collection of utilities and processors for the Python Imaging Libary"
arch=('any')
url="https://github.com/matthewwithanm/pilkit/"
license=('BSD')
depends=('python2' 'python2-pillow')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('dc586362902dcc1110d487d7c8ffd5e4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
