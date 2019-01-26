# Maintainer: lll2yu <lll2yu@protonmail.com>
# Original Theme by: Andrés Rodríguez <https://gitlab.com/mixedCase>

pkgname=sddm-lain-wired-theme
pkgver=0.9.1
pkgrel=1
pkgdesc='A sddm theme inspired by Serial experiments lain'
arch=('any')
url='https://github.com/lll2yu/sddm-lain-wired-theme'
license=('CCPL:cc-by-sa 4.0')

depends=('sddm' 'qt5-multimedia' 'qt5-quickcontrols')
optdepends=('gst-plugins-good: For audio playback'
	    'gst-plugins-bad: For audio playback')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lll2yu/${pkgname}/archive/${pkgver}.tar.gz"
)

sha512sums=(
	'1c01eb3f4859ad4aa96076f9c917835a76b2c29ab1fde274bedacdb744058960363221f69b405a6646d65bcd4154e2e2d1ab3ca34b577a176644f72a044c70ac'
)

package() {
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${pkgname}/
}
