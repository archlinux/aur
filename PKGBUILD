# Maintainer: K1412 <jonathan@opensides.be>
pkgname=javascript-common
pkgver=1.0
pkgrel=4
pkgdesc="Group javascript libraries in /usr/share/javascript/"
arch=('any')
install=${pkgname}.install
license=('GPL')
url='http://www.invalid.invalid'

source=('javascript-common.conf::http://git.fusiondirectory.org/gitweb/?p=packaging/archlinux.git;a=blob_plain;f=scripts/javascript-common/javascript-common.conf;hb=refs/heads/master')
md5sums=('f9b66751e66c39bb23269d0251a76242')

package() {
  mkdir -p ${pkgdir}/usr/share/javascript/

  mkdir -p ${pkgdir}/etc/httpd/conf/extra/
  cp $srcdir/${pkgname}.conf $pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf
}
