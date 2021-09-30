# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: Dariusz Górecki <darek.krk@gmail.com>
# Contributor: Juan Diego Tascon

pkgname=xcursor-comix-opaque
pkgver=0.9.2
pkgrel=1
pkgdesc='Comix X Cursor Theme (Opaque version)'
url='https://gitlab.com/limitland/comixcursors'
depends=('libxcursor')
license=('GPL')
arch=('any')
source=("https://limitland.gitlab.io/comixcursors/ComixCursors-Opaque-${pkgver}.tar.bz2")
sha256sums=('e39256d6a5169cf9c26cc3f929b2b5345686adb62051ccfaf0c5b1b4b54af6f7')

package() {
  mkdir -p "${pkgdir}"/usr/share/icons
  cp -R "${srcdir}"/ComixCursors-[A-Z]* "${pkgdir}"/usr/share/icons/
}

