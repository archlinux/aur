# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

_pkgbase=python-aalib
pkgname=python2-aalib
pkgver=0.3
pkgrel=1
pkgdesc="Python 2.x bindings for AAlib"
arch=('any')
url="http://jwilk.nfshost.com/software/python-aalib.html"
license=("GPL2")
depends=('python2' 'aalib' 'python2-imaging')
source=(http://pypi.python.org/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('00afa7ef3479649cec99046449c07ef9')

package() {
  cd "$srcdir"/${_pkgbase}-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
}
