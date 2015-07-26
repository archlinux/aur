# Maintainer: Julian Leyh <julian@vgai.de>
# Maintainer: charlie5 on #ada @ freenode


pkgname=sphinxcontrib-adadomain
pkgver=0.1
pkgrel=1
pkgdesc="adadomain sphinxcontrib extension"
arch=('any')
url="http://bitbucket.org/birkenfeld/sphinx-contrib"
license=('BSD')
depends=('python2-sphinx')
source=(https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0268c912c89614d385f64fa26b756d52')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
