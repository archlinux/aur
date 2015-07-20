# Contributor: Mildred <silkensedai@online.fr>
# Adopted by Gour <gour@mail.inet.hr>
# Adopted by medlefsen <matt.edlefsen@gmail.com>
# Adopted by pnutzh4x0r <pnutzh4x0r@gmail.com>
# Adopted by L42y <423300@gmail.com>
# Adopted by Atomisirsi <atomisirsi@gsklan.de>

pkgname=bzr-svn-plugin
_pkgname=bzr-svn
pkgver=1.2.3
pkgrel=1
pkgdesc="subversion foreign branch support for bazaar"
arch=('i686' 'x86_64')
url="http://www.samba.org/~jelmer/bzr-svn/"
license=('GPL')
conflicts=('bzr-svn')
replaces=('bzr-svn')
depends=('bzr>=2.5' 'subvertpy>=0.9.0')
source=("http://samba.org/~jelmer/bzr/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a7664a536a26c0a187c41789021f36f7')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root=${pkgdir}
}
