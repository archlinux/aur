# Maintainer: Sergej Pupykin <sergej@aur.archlinux.org>
# Maintainer: tardo <tardo@nagi-fanboi.net>

pkgname=sconstools-hg
_hgrepo=sconstools
pkgver=148
pkgrel=1
pkgdesc="Extenstions to the SCons build system"
arch=('any')
url="http://bitbucket.org/jmb/sconstools"
license=('custom')
depends=('python' 'scons')
provides=('sconstools')
source=("hg+http://bitbucket.org/jmb/${_hgrepo}")
md5sums=('SKIP')

package() {
  cd $startdir/src/$_hgrepo
  python2 setup.py install --root=$pkgdir
}

