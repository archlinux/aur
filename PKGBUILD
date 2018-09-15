# Maintainer: lll2yu <lll2yu@protonmail.com>
# Original Theme by: Andrés Rodríguez <https://gitlab.com/mixedCase>

pkgname=sddm-lain-wired-theme
pkgver=0.9
pkgrel=2
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
	'66f07cd8f087d97bb4c0edfadd4b9a92d4e4d8249d7b4ef06dfe2ff0c142c1f8757d18a88f9686f3b09d273a4d0df69a6b868292593182bd865b63c68726c79a'
)

package() {
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${pkgname}/
}
