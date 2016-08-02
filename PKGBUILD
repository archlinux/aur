# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=wiring
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="Architectural foundation for Python applications"
arch=('any')
url="https://github.com/msiedlarek/wiring"
license=('Apache')
depends=('python-six'
     		 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/msiedlarek/wiring/archive/v$pkgver.tar.gz")
md5sums=('6d64bbbadb8b05927caa669a023e9153')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
