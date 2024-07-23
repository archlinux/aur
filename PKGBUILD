# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
pkgname=sddm-theme-greenleaf
_themename=greenleaf
pkgver=1.0
pkgrel=1
pkgdesc="GreenLeaf theme for SDDM"
arch=("any")
url="https://github.com/kamack38/sddm-greenleaf"
license=("LGPL3")
depends=('sddm' 'qt6-5compat' 'qt6-declarative' 'qt6-svg' 'ttf-jetbrains-mono-nerd')
makedepends=("git")
source=("git+https://github.com/kamack38/sddm-greenleaf")
md5sums=("SKIP")

package() {
	cd "${srcdir}/${pkgname}"
	_themedir="${pkgdir}/usr/share/sddm/themes/$_themename"
	find . -type f -exec install -Dm644 {} "${_themedir}/{}" \;
}
