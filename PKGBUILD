# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=python2-caldav
pkgver=0.4.0
pkgrel=2
pkgdesc="a caldav client library"
arch=('any')
url="https://bitbucket.org/cyrilrbt/caldav/wiki/Home"
license=('GPL')
depends=('python2' 'python2-lxml' 'python2-vobject' 'python2-dateutil' 'python2-distribute' 'python2-six' 'python2-requests')
backup=()
conflicts=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/c/caldav/caldav-${pkgver}.tar.gz)

package() {
  cd "$srcdir/caldav-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -r "$pkgdir/usr/lib/python2.7/site-packages/tests"
}

# vim:set ts=2 sw=2 et:
md5sums=('0ebae509fb16e1ee7c113639c1567645')
sha1sums=('c94d749f22767162693bb8523acd45f6f3c83a1b')
sha256sums=('1e512f2989901d853ba43a3e98b1daff77569663ac3a7e29492fcecf4e86f858')
