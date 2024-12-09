# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>
# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=firefox-auto-tab-discard
pkgver=0.6.7
pkgrel=2
pkgdesc='Use native tab discard method to automatically reduce memory usage of inactive tab'
url=https://webextension.org/listing/tab-discard.html
arch=('any')
license=('MPL-2.0')
depends=('firefox')
groups=('firefox-addons')
source=(
	"auto_tab_discard-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/4045009/auto_tab_discard-${pkgver}.xpi"
)
b2sums=(
	'65b988d2cefdf815c689644d3fca2a441ac55a1431f4fc1f8dd1e6227cc46bc2f3184e6c1c09ce2fc65a2e9ee3fbb5475e5a291de6f027ac00710bc044cc5fbc'
)

package() {
	install -Dm644 "auto_tab_discard-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{c2c003ee-bd69-42a2-b0e9-6f34222cb046}.xpi"
}

