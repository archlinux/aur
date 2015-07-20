# Adopted by pnutzh4x0r <pnutzh4x0r@gmail.com>
# Adopted by L42y <423300@gmail.com>
# Adopted by Atomisirsi <atomisirsi@gsklan.de>

pkgname=subvertpy
pkgver=0.9.1
pkgrel=1
pkgdesc="Alternative Python bindings for Subversion, split out from bzr-svn."
arch=('i686' 'x86_64')
url="https://www.samba.org/~jelmer/subvertpy"
license=('GPL3')
depends=('python2')
makedepends=('apr-util' 'subversion')
source=("https://www.samba.org/~jelmer/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('365ff13066def2cac0bc0de75502d3d3')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}

