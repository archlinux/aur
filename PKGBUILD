# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-pytest-xprocess
_pkgname=pytest-xprocess
pkgver=0.8
pkgrel=1
pkgdesc='pytest plugin to manage external processes across test runs.'
arch=('i686' 'x86_64')
url='http://bitbucket.org/hpk42/pytest-xprocess/'
license=('MIT')
depends=('python2-pytest')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('d973e40aa6bc77a5b88ce75bf0239840')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
