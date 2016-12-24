# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=wiring
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc="Architectural foundation for Python applications"
arch=('any')
url="https://github.com/msiedlarek/wiring"
license=('Apache')
depends=('python-six' 'python' 'python-venusian')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/msiedlarek/wiring/archive/v$pkgver.tar.gz")
md5sums=('8f7aed30a47e4719de588d6762fdeb3f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
