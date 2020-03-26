# Maintainer: Christian Humm <mail@c-m-l.net>

pkgname=antergos-wallpapers
pkgver=0.7
pkgrel=4
pkgdesc="The default wallpapers for Antergos"
arch=('any')
url="http://www.antergos.com"
license=('CCPL:by-nc-sa')
source=("https://github.com/Antergos/wallpapers/archive/${pkgver}.tar.gz")
sha256sums=('b0ff5140583ec6b77843d14989ac36735f8b21b4c3c14bf5304a73d5d2d1aeda')

package() {
  cd "${srcdir}/wallpapers-${pkgver}"
  install -d "${pkgdir}/usr/share/antergos/wallpapers"
  install -m644 *.jpg "${pkgdir}/usr/share/antergos/wallpapers/"
  install -m644 *.png "${pkgdir}/usr/share/antergos/wallpapers/"

  install -d "${pkgdir}/usr/share/cinnamon-background-properties"
  install -m644 antergos-backgrounds-4-3.xml "${pkgdir}/usr/share/cinnamon-background-properties/"

  install -d "${pkgdir}/usr/share/gnome-background-properties"
  install -m644 antergos-backgrounds-4-3.xml "${pkgdir}/usr/share/gnome-background-properties/"
}
