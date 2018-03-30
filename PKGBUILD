# Maintainer: lll2yu <lll2yu@protonmail.com>
# Original Theme by: Andrés Rodríguez <https://gitlab.com/mixedCase>

pkgname=sddm-lain-wired-theme
pkgver=0.1
pkgrel=1
pkgdesc='A sddm theme inspired by Serial experiments lain'
arch=('any')
url='https://github.com/lll2yu/sddm-lain-wired-theme'
license=('CCPL:cc-by-sa 4.0')

depends=('sddm')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lll2yu/${pkgname}/archive/${pkgver}.tar.gz"
)

sha512sums=(
	'ed9228e7bb42ac4d405dfbbc9755e9b999a0f9af362e2068c2c69451fd8986af6359b759c6e1bcbf0cf67da84dc75d3a6fbc28dddb2e674b9d24b4e684497259'
)

package() {
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${pkgname}/
}
