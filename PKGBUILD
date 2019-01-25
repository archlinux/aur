# Maintainer: bilabila <bilabila@qq.com>
pkgname=fish-xsession
pkgver=1
pkgrel=1
pkgdesc="fish -l as xsession from your display manager"
arch=('any')
license=('MIT')
provides=('fish-xsession')
source=('fish-xsession' 'fish.desktop')
md5sums=('5bb7c93f0ad23120c33f6370730b4f62' '389c598be068a4b4a998e30d7ef44c84')
package() {
  install -d -m 755 ${pkgdir}/usr/bin
  cp fish-xsession ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/xsessions
  cp fish.desktop ${pkgdir}/usr/share/xsessions/
}
