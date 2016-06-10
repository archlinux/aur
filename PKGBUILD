# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=lib_users
pkgver=0.9
pkgrel=1
pkgdesc='Checks /proc for libraries being mapped but marked as deleted'
arch=('any')
url='http://www.schwarzvogel.de/software/lib_users.html'
license=('GPL2')
depends=('python')  # works with any version of python
#depends=('python2') # you can choose python2
source=("http://schwarzvogel.de/pkgs/${pkgname}-${pkgver}.tar.gz")
md5sums=('42cbcae61c57352444fc0711194d2885')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 lib_users.py "${pkgdir}/usr/bin/lib_users"
  install -D -m644 README "${pkgdir}/usr/share/doc/lib_users/README"
}
