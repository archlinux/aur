# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=3.1.0
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/06/0c/bcd4769c333096f584b5d83b2a8e2e36a57e8ba1fc12a63fc9b27eebeee8/$_realname-$pkgver.tar.gz")
md5sums=('c2792b217903907d6a0eed075cb9e01c')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
