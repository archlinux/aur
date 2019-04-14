# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=pop-xfwm-theme
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple Xfwm theme for Xfce matching Pop GTK theme from Pop!_OS by System76."
arch=(any)
url="https://www.xfce-look.org/p/1299758/"
license=('GPL2')
depends=('xfwm4')
source=(
  https://gitlab.com/spass/pop-xfwm-theme/-/archive/master/pop-xfwm-theme-master.tar.gz
)

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/${pkgname}-master/Pop-Xfwm"* "${pkgdir}/usr/share/themes"
}

# vim:set ts=2 sw=2 et:
md5sums=('f509ad89954a684012fedc64dd01cb77')
