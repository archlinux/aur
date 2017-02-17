# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=python-pilkit
_pkgname=pilkit
pkgver=2.0
pkgrel=1
pkgdesc="A collection of utilities and processors for the Python Imaging Libary"
arch=('any')
url="https://github.com/matthewwithanm/pilkit/"
license=('BSD')
depends=('python' 'python-pillow')
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('1b187cddbaaec56c4797679949de44ee')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
