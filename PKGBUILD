# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-pytest-localserver
_pkgname=pytest-localserver
pkgver=0.3.3
pkgrel=1
pkgdesc='pytest plugin to test server connections locally.'
arch=('i686' 'x86_64')
url='http://bitbucket.org/basti/pytest-localserver/'
license=('MIT')
depends=('python-pytest')
source=("https://bitbucket.org/basti/${_pkgname}/downloads/${_pkgname}-$pkgver.tar.gz")
md5sums=('44507e8db3456bffbe9d645135facb58')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
