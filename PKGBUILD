# Co-maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=sddm-theme-astronaut
_themename=astronaut
pkgver=1.0
pkgrel=1
pkgdesc="Beautiful SDDM astronaut theme"
arch=("any")
url="https://github.com/joe733/sddm-theme-astronaut"
license=("LGPL3")
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg')
makedepends=("git")
source=("git+https://github.com/joe733/sddm-theme-astronaut.git")
md5sums=("SKIP")
package() {
  cd "${srcdir}/${pkgname}"

  _themedir="${pkgdir}/usr/share/sddm/themes/$_themename"

  find . -type f -exec install -Dm644 {} "${_themedir}/{}" \;
}
