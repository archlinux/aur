# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pydns
_realname=py3dns
pkgver=3.2.1
pkgrel=1
pkgdesc="A module for looking up DNS entries in Python applications"
arch=('any')
url="https://launchpad.net/py3dns"
license=('Python')
depends=('python')
makedepends=('python-setuptools')
source=("https://launchpad.net/${_realname}/trunk/${pkgver}/+download/${_realname}-${pkgver}.tar.gz")
md5sums=('35a441081a1acfa0cf78e7ccc2ff9449')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
