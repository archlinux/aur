# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=numix-cursor-maia
pkgver=1.0
pkgrel=1
pkgdesc="Numix cursor theme for ArchLinux"
arch=('any')
url="http://numixproject.org/"
license=('GPLv3')
makedepends=('git')
source=("Numix-Cursor-Maia.tar.xz")
sha256sums=('91e24b6b6d1395b50d99735527d9508ef0a0d2c64c0a20c8f9e870515a3ab004')

package() {
  cd Numix-Cursor-Maia
  install -dm 755 "${pkgdir}/usr/share/icons"
  mkdir -v "${pkgdir}/usr/share/icons/Numix-Cursor-Maia"
  cp -avr * "${pkgdir}/usr/share/icons/Numix-Cursor-Maia/"
}
