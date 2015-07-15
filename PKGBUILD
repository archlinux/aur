# Maintainer: Fabien Devaux <fdev31@gmail.com>

_py="python2"
_name="jukebox"
pkgname=$_py-$_name
pkgver=0.4.1
pkgrel=2
pkgdesc="Democratic Jukebox - your democratic music player"
arch=(any)
url="http://github.com/lociii/$_name"
license=('MIT')
groups=()
depends=("$_py" 'python2-django' 'mutagen' 'django-social-auth' 'python2-django-rest-framework' 'python2-shout' 'python2-daemon' 'python2-pyinotify' 'python2-simplejson')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/j/jukebox/jukebox-${pkgver}.tar.gz")
md5sums=('2451323ef346229e3986ae2203232391')

package() {
  cd "$srcdir/$_name-$pkgver"
  $_py setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
