# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Tomas A. Schertel <tschertel.at.gmail.com>
# Contributor: Lauri Jäntti <lauri.jantti@cs.joensuu.fi>

_pkgname=Elixir
pkgname=python2-elixir
pkgver=0.7.1
pkgrel=2
pkgdesc="Declarative mapper for SQLAlchemy"
url="http://elixir.ematia.de/"
license=('MIT')
arch=('any')
depends=('python2-sqlalchemy')
source=(http://pypi.python.org/packages/source/E/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('5615ec9693e3a8e44f69623d58f54116')

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

