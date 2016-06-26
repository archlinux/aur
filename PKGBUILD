# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Andrejs Mivre??iks <gim at fastmail dot fm>
pkgname='python-irclib'
pkgver='14.2.2'
pkgrel=3
pkgdesc='Internet Relay Chat (IRC) protocol client library'
arch=('any')
url='https://pypi.python.org/pypi/irc/14.2.2'
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python2-pip')
source=('git://github.com/jaraco/irc.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/irc"
  echo :: Installing for python3.5 ...
  pip install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
  echo :: Installing for python2.7 ...
  pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed . 
}
