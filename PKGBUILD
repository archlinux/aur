# Maintainer: Shivanshu <87352198+totoro-ghost@users.noreply.github.com>
# Contributor: Nobody <nobody@example.com>

pkgname=sddm-theme-astronaut
_themename=astronaut
pkgver=1.0
pkgrel=1
pkgdesc="Beautiful SDDM astronaut theme"
arch=("any")
url="https://github.com/totoro-ghost/sddm-astronaut"
license=("LGPL3")
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=("git")
source=("git+https://github.com/totoro-ghost/sddm-astronaut")
md5sums=("SKIP")
package() {
  cd "${srcdir}/${pkgname}"
  _themedir="${pkgdir}/usr/share/sddm/themes/$_themename"
  find . -type f -exec install -Dm644 {} "${_themedir}/{}" \;
}
