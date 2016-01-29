# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python2
_n=pydub

pkgname=$_py-$_n
pkgver=0.16.3
pkgrel=1
pkgdesc="Manipulate audio with an simple and easy high level interface"
depends=($_py 'ffmpeg')
makedepends=($_py "$_py-distribute")
arch=('any')
conflicts=("$_py-$n-git")
source=(http://pypi.python.org/packages/source/p/$_n/$_n-$pkgver.tar.gz)
md5sums=('f1825422225bb8614cd808aa94916fd7')
url="http://pydub.com"
license="MIT"

package() {
  cd $srcdir/$_n-$pkgver
  $_py setup.py build || return 1
  $_py setup.py install --root=$pkgdir
}
