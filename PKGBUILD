# Maintainer: Jean Abdel <mm54dm2vja@esiix.com>

pkgname=akaruu-gros-beurre
pkgver=1.0.0
pkgrel=1
pkgdesc="Ce gros dindon d'Akaruu"
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
