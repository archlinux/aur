# $Id$
# Maintainer: Mladen Pejaković <pejakm@autistici.org>

pkgname=kim-frameworks
pkgver=0.9.5
pkgrel=4
pkgdesc="Plasma 5 Image Menu to compress, resize, convert, rotate and webexport"
url="https://www.linux-apps.com/content/show.php?content=11505"
arch=(any)
license=(GPL2)
depends=('bash' 'imagemagick' 'kdialog')
source=("http://bouveyron.free.fr/kim/release/kim4-0.9.5.tar.gz")
sha1sums=('1bbc85543c46c04420adb0491683c79d2ff1d142')

package() {
  cd kim4/src
  install -d ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m644 kim_{compressandresize,convertandrotate}.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m755 bin/kim_{compress,convert,flipflop,resize,rotate,webexport} ${pkgdir}/usr/bin/
}
