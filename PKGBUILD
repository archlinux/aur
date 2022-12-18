# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

pkgname=draco_static_lib_compat
pkgver=0.1
pkgrel=1
pkgdesc='A dummy libdraco.a to fix draco package'
arch=('x86_64')
license=('BSD')

package() {
  mkdir -p $pkgdir/usr/lib/
  touch $pkgdir/usr/lib/libdraco.a
}
