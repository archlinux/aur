# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdecs='Typeface based loosely on early Grotesques with extensive OpenType features'
pkgname='otf-work-sans'
pkgver='1.6'
pkgrel='1'
replaces=('otf-work-sans-ibx')
provides=('otf-work-sans-ibx')
conflicts=('otf-work-sans-ibx')
depends=('fontconfig')
arch=('any')
license=('custom:OFL')
url='http://weiweihuanghuang.github.io/Work-Sans/'
source=("https://github.com/weiweihuanghuang/Work-Sans/archive/v${pkgver}.tar.gz")
sha512sums=('a8e37c867b188285d6145907b5b1deabfb8373a6ab73b0e5ff5159352cc6d3f083217b667fb53eb6637920ffb24467eb18cd26a347428ba6e9587e44f11974a4')

package () {
	cd "Work-Sans-${pkgver}"
	install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" fonts/desktop/*.otf
	install -m644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
