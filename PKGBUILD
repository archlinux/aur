# Maintainer: Atomisirsi <atomisirsi@gsklan.de>
# Contributor: L42y <423300@gmail.com>
# Contributor: pnutzh4x0r <pnutzh4x0r@gmail.com>
pkgname=subvertpy
pkgver=0.9.2
pkgrel=1
pkgdesc="Alternative Python bindings for Subversion, split out from bzr-svn."
arch=('i686' 'x86_64')
url="https://www.samba.org/~jelmer/subvertpy"
license=('GPL3')
depends=('python2')
makedepends=('apr-util' 'subversion')
source=("https://www.samba.org/~jelmer/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2a4f5426541605d620ac13b1c9cf4a1f')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
