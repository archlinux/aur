# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=wiring
pkgname=python-$_pkgname
pkgver=0.2.4
pkgrel=1
pkgdesc="Architectural foundation for Python applications"
arch=('any')
url="https://github.com/msiedlarek/wiring"
license=('Apache')
depends=('python-six'
     		 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/w/wiring/wiring-$pkgver.tar.gz")
md5sums=('0cd3b1d583e4226c610e845a7b61c0d7')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
