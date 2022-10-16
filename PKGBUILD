# Maintainer: MaKaNu <matti dot kaupenjohann at fh minus dortmund dot de>
# Contributor: MaKaNu <matti dot kaupenjohann at fh minus dortmund dot de>

pkgname=sddm-theme-industrial
_themename=industrial
_themesrc=sddm-industrial
pkgver=1.0
pkgrel=1
pkgdesc="Industrial SDDM theme"
arch=("any")
url="https://github.com/MaKaNu/sddm-industrial"
license=("GPL3")
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=("git")
source=("git+https://github.com/MaKaNu/sddm-industrial.git")
md5sums=("SKIP")
package() {
	cd "${srcdir}/${_themesrc}"

  _themedir="${pkgdir}/usr/share/sddm/themes/$_themename"

  find . -type f -exec install -Dm644 {} "${_themedir}/{}" \;
}
