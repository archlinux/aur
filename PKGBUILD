# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=hsluv
pkgname=python-$_name
pkgver=0.0.2
pkgrel=1
pkgdesc="Human-friendly HSL"
arch=('any')
url="https://pypi.python.org/pypi/hsluv/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('7ba7b058e6c8773ee0962d7467921d76e9302f2941d06e1a9475c78c24d2fd08ea389877cd7c4732b5b278ead033791c76bf1edbc270aaa071088532b937c24e')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
