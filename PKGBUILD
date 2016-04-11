# Maintainer: Christoph Stahl <christoph.stahl@uni-dortmund.de>
pkgname=pyspellbook
pkgname_=pySpellbook
pkgver=0.9.0.1
pkgrel=1
pkgdesc="A PDF spellbook creation utility for d20 games in python "
arch=("any")
url="http://christofsteel.github.io/pySpellbook/"
license=('apache2')
groups=()
depends=('python' 'python-pyside' 'python-appdirs' 'python-sqlalchemy' 'python-jinja')
optdepends=('python-pyquery: import scripts'
           'python-weasyprint: better fallback rendering')
makedepends=('python')
options=(!emptydirs)
source=("https://github.com/christofsteel/${pkgname_}/archive/v${pkgver}.tar.gz")

package() {
  cd "$srcdir/${pkgname_}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('5479fb0af0eac27ffc6bf7f058978495')
