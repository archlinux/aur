# Maintainer: Alexandre Filgueira <faidoc@gmail.com>

pkgname=antergos-wallpapers
pkgver=0.7
pkgrel=2
pkgdesc="The default wallpapers for Antergos"
arch=('any')
url="http://www.antergos.com"
license=('CCPL:by-nc-sa')
source=("http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('00a03ab227bb25cc4fa170c60b95f0464c930e58fac5870cbb99b267ad162789')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/antergos/wallpapers"
  install -m644 usr/share/antergos/wallpapers/*.jpg "${pkgdir}/usr/share/antergos/wallpapers/"
  install -m644 usr/share/antergos/wallpapers/*.png "${pkgdir}/usr/share/antergos/wallpapers/"

  install -d "${pkgdir}/usr/share/cinnamon-background-properties"
  install -m644 usr/share/cinnamon-background-properties/antergos.xml "${pkgdir}/usr/share/cinnamon-background-properties/"
  
  install -d "${pkgdir}/usr/share/gnome-background-properties"
  install -m644 usr/share/gnome-background-properties/antergos-backgrounds-4-3.xml "${pkgdir}/usr/share/gnome-background-properties/"
}
