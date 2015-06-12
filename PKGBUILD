# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=python2-zope-deprecation
_pkgname=zope.deprecation
pkgver=4.1.2
pkgrel=1
pkgdesc="Zope 3 Deprecation Infrastructure"
arch=('any')
url="http://pypi.python.org/pypi/zope.deprecation"
license=('ZPL')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/z/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e9a663ded58f4f9f7881beb56cae2782')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
