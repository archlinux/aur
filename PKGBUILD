# $Id$
# Maintainer: Fabien Devaux <fdev 31 @ gmail dot com>
# Contributor: Dolph Mathews

pkgname=httpcli
provides=('httpcli')
pkgver=1.1.3
pkgrel=1
pkgdesc="RESTful command line HTTP client (simpler than cURL)."
arch=('any')
url="http://github.com/dolph/httpcli"
license=('MIT')

groups=()
depends=('python2' 'python2-httplib2')
makedepends=()
provides=()
conflicts=('python-httpie' 'python2-httpie')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz#md5=0faf9009cefc297c2e82d4133f5afec7")
md5sums=('0faf9009cefc297c2e82d4133f5afec7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
