# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
pkgname=dbm
pkgver=0.11.0
_pkgver=${pkgver}-20080519-114741
pkgrel=4
pkgdesc="A little tool to access gdbm files from shell"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('gdbm')
changelog='ChangeLog'
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('664002670194f213c09cde05aeadd6f9')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
