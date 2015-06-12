# $Id$
# Maintainer: Ryan Owens <RyanOwens@linux.com>

pkgname=ozunity-wallpapers
pkgver=0.1
pkgrel=4
pkgdesc="Background images and Logos for Oz Unity"
arch=('any')
makedepends=('intltool')
url="http://www.ultimateeditionoz.com"
license=('CCPL')
source=("git://github.com/ryanvade/ozunity-wallpapers.git")
md5sums=('SKIP')

package() {
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_01.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_01.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_02.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_02.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_03.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_03.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_04.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_04.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_05.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_05.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_06.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_06.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_07.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_07.jpg"
  install -Dm644 "${srcdir}/${pkgname}/Archane_Circles_08.jpg" "${pkgdir}/usr/share/backgrounds/Archane_Circles_08.jpg"
  install -Dm644 "${srcdir}/${pkgname}/new_Logo.png"           "${pkgdir}/usr/share/icons/OzUnity_Logo.png"

  mkdir -p ${pkgdir}/etc/skel/.local/share/gnome-background-properties

  install -Dm644 "${srcdir}/${pkgname}/gnome-backgrounds.xml" "${pkgdir}/etc/skel/.local/share/gnome-background-properties/gnome-backgrounds.xml"
}
