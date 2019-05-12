# Maintainer: johnnybash <georgpfahler at wachenzell dot org>
# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python2-pydns
_realname=pydns
pkgver=2.3.6
pkgrel=1
pkgdesc="A module for looking up DNS entries in Python applications"
arch=('any')
url="https://launchpad.net/py3dns"
license=('Python')
depends=('python')
source=("https://launchpad.net/${_realname}/${pkgver}/${pkgver}/+download/${_realname}-${pkgver}.tar.gz")
md5sums=('d12ca75251854ab6fcabbaff6909b690')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
