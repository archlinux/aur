# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=sorr
pkgver=5.0
pkgrel=1
pkgdesc="Streets of Rage Remake (fan remake)"
arch=('i686' 'x86_64')
url="http://www.soronline.net/sorr.htm"
license=('GPL')
makedepends=('git')
source=("http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz")
md5sums=('SKIP')

build() {

  # nothing to build
  :
 

}

package() {

  mkdir -p "${pkgdir}/usr/share/games/sorr"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/doc/sorr"
  mkdir -p "${pkgdir}/usr/bin"

  install -dm755 "${srcdir}/data" "${pkgdir}/usr/share/games/sorr"
  install -dm755 "${srcdir}/manual" "${pkgdir}/usr/share/games/sorr"
  install -dm755 "${srcdir}/mod" "${pkgdir}/usr/share/games/sorr"
  install -dm755 "${srcdir}/palettes" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/bgdc" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/bgdi" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/SorMaker.dat" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/SorR.dat" "${pkgdir}/usr/share/games/sorr"

  install -m644 "${srcdir}/sorr.png" "${pkgdir}/usr/share/pixmaps"

  install -m644 "${srcdir}/Manual.html" "${pkgdir}/usr/share/doc/sorr"

  install -m644 "${srcdir}/sorr.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/sorr" "${pkgdir}/usr/bin/sorr"

}
