# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pydns
_realname=py3dns
pkgver=3.1.0
pkgrel=1
pkgdesc="A module for looking up DNS entries in Python applications"
arch=('any')
url="https://launchpad.net/py3dns"
license=('Python')
depends=('python')
source=("https://launchpad.net/${_realname}/trunk/${pkgver}/+download/${_realname}-${pkgver}.tar.gz")
md5sums=('fab47dbea2d37402752a3c5ec72b68a2')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
