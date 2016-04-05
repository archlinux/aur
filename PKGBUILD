# Maintainer:  AppleBloom <rat.o.drat@gmail.com>

_pkgname='zulip'
pkgname="python2-$_pkgname-api"
pkgver='0.2.5'
pkgrel='1'
pkgdesc="Python bindings for zulip API."
arch=('i686' 'x86_64')
url="https://zulip.com/api/#python"
license=('MIT')
depends=('python2-simplejson' 'python2-requests')
source=('https://www.zulip.com/dist/api/python-zulip_0.2.5.tar.gz')
md5sums=('1db6ff94dd08fa50030925d72141a655')


package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
