# Maintainer: Modeler <dantootill at gmail.com>
pkgname=openbox-theme-adwaita
pkgver=1.0
pkgrel=1
pkgdesc="Openbox theme to integrate with the default Adwaita GTK+ theme."
arch=(any)
url="http://box-look.org/content/show.php/Adwaita-openbox?content=155042"
license=('LGPL')
depends=('openbox')
provides=('openbox-theme-adwaita')
source=('Adwaita-openbox.obt')
md5sums=('7aa2b760196c339cf135a82a2afbedbe')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -R Adwaita-openbox ${pkgdir}/usr/share/themes
}
