#Maintainer: Kaushal M kshlmster@gmail.com
pkgname=python2-bugzillatools
_pkgname=bugzillatools
pkgver=0.5.5
pkgrel=1
pkgdesc="Bugzilla CLI client, XML-RPC binding and VCS plugins"
arch=('any')
url="https://github.com/frasertweedale/bugzillatools"
license=('GPL3')
depends=('python2')
source=(https://github.com/frasertweedale/bugzillatools/archive/v${pkgver}.tar.gz)
md5sums=('dd640e05a9d19063c51681b28125b14b')

package(){
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
