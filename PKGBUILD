# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=lib_users
pkgver=0.7
pkgrel=1
pkgdesc='Checks /proc for libraries being mapped but marked as deleted'
arch=('any')
url='http://schwarzvogel.de/software-misc.shtml'
license=('GPL2')
depends=('python')  # works with any version of python
#depends=('python2') # you can choose python2
source=("http://schwarzvogel.de/pkgs/${pkgname}-${pkgver}.tar.gz")
md5sums=('785548431e3a6ee59d1c6fa37367ea4f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 lib_users.py "${pkgdir}/usr/bin/lib_users"
  install -D -m644 README "${pkgdir}/usr/share/doc/lib_users/README"
}
